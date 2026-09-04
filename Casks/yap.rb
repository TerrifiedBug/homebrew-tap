cask "yap" do
  version "0.3.0"
  sha256 "75abdb94fec28f4ed9b8ec5a133f23430e1c8f930818393cf125ded67fb25716"

  url "https://github.com/TerrifiedBug/yap/releases/download/v#{version}/yap-#{version}.dmg"
  name "yap"
  desc "On-device dictation and meeting transcription"
  homepage "https://github.com/TerrifiedBug/yap"

  # Parakeet runs on the Apple Neural Engine; there is no Intel build.
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "yap.app"
  # No "binary" stanza. yap is a menu-bar app; the only subcommand
  # left is "bench", which is a development tool, and putting a
  # second path to the same executable on PATH is how the daemon
  # ended up with two LaunchServices identities in the first place.

  # Homebrew replaces /Applications/yap.app, but a process keeps the
  # image it already mapped. Without this you stay on the old version
  # until something restarts the daemon, while "yap --version" reads
  # the new binary on disk and agrees with the version you just
  # installed — the worst shape for a bug, because it looks fixed.
  #
  # The rewrite first, and it is not cosmetic. yap 0.2's plist ran
  # "yap run --skip-doctor", an argument 0.3 does not take: launchd
  # would start it, ArgumentParser would exit 64, KeepAlive would
  # relaunch it, and the login item would spin for ever. Nothing but
  # this line and yap itself ever rewrites that file.
  #
  # bootout + bootstrap rather than "kickstart -k", because launchd
  # reads a plist when the job is bootstrapped and not again — a
  # kickstart would faithfully relaunch the arguments it already had
  # in memory, rewritten file or not.
  #
  # Measured, because the alternative is losing someone's meeting:
  # bootout delivers SIGTERM, not SIGKILL, and yap catches SIGTERM
  # and routes it through applicationWillTerminate. So a recording in
  # flight is finalized and transcribes on the next start instead of
  # losing its meta.json.
  #
  # must_succeed: false throughout because an install with no login
  # item has no job to restart, and launchctl exits 113 there. Not
  # having asked for launch-at-login is not a reason to fail an
  # upgrade.
  postflight do
    agent = File.expand_path("~/Library/LaunchAgents/com.terrifiedbug.yap.plist")
    next unless File.exist?(agent)

    system_command "/usr/bin/plutil",
                   args:         ["-replace", "ProgramArguments", "-json",
                                  %Q(["#{appdir}/yap.app/Contents/MacOS/yap", "run"]),
                                  agent],
                   must_succeed: false
    system_command "/bin/launchctl",
                   args:         ["bootout", "gui/#{Process.uid}/com.terrifiedbug.yap"],
                   must_succeed: false
    system_command "/bin/launchctl",
                   args:         ["bootstrap", "gui/#{Process.uid}", agent],
                   must_succeed: false
  end

  # No uninstall stanza at all, and both halves of that are
  # deliberate. Homebrew runs these directives on upgrade as well as
  # uninstall: "launchctl" deletes
  # ~/Library/LaunchAgents/<label>.plist, so every upgrade would
  # quietly switch launch-at-login off, and "quit" is recorded and
  # then reopened with "open -b" afterwards, which would start the
  # daemon outside launchd where the login item cannot reach it.
  #
  # Neither is a loss, because the cask never started the daemon.
  # The "Launch at login" toggle in Settings did, and it owns
  # stopping it.

  # zap only runs on "brew uninstall --zap", which is the one time
  # taking the login item away is what was asked for. launchctl
  # deletes the plist itself, so it is not repeated under trash.
  #
  # Not the models: they live in FluidAudio's machine-global cache,
  # shared with every other FluidAudio client, so removing them here
  # would cost someone else a 220 MB download.
  zap launchctl: "com.terrifiedbug.yap",
      trash:     [
        "~/.config/yap",
        "~/Library/Logs/yap",
      ]

  caveats <<~CAVEAT
    Launch yap from Applications. It asks for the permissions it
    needs from the menu bar, and downloads the model in the
    background on first run.

    To remove everything, including the login item:
      brew uninstall --zap --cask yap
  CAVEAT
end
