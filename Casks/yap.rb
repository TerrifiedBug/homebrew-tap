cask "yap" do
  version "0.1.0"
  sha256 "9af49ea38dbf403c60b99f10cbbaf2390d277bffaee960a4b7ae2a7befa0633d"

  url "https://github.com/TerrifiedBug/yap/releases/download/v#{version}/yap-#{version}.dmg"
  name "yap"
  desc "On-device dictation and meeting transcription"
  homepage "https://github.com/TerrifiedBug/yap"

  # Parakeet runs on the Apple Neural Engine; there is no Intel build.
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "yap.app"
  # yap is a CLI first. The bundle exists so the build can be
  # notarized and so TCC has something stable to hang grants on; this
  # puts the command itself on PATH.
  binary "#{appdir}/yap.app/Contents/MacOS/yap"

  # No uninstall stanza at all, and both halves of that are
  # deliberate. Homebrew runs these directives on upgrade as well as
  # uninstall: "launchctl" deletes
  # ~/Library/LaunchAgents/<label>.plist, so every upgrade would
  # quietly switch launch-at-login off, and "quit" is recorded and
  # then reopened with "open -b" afterwards, which would start the
  # daemon outside launchd where neither "yap stop" nor the login
  # item can reach it.
  #
  # Neither is a loss, because the cask never started the daemon.
  # "yap install --launch-at-login" did, and it owns stopping it.

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
    Finish setting up with:
      yap setup
      yap install --launch-at-login

    The login item belongs to yap rather than to this cask, so a
    plain uninstall leaves it behind. To remove everything:
      yap install --uninstall
      brew uninstall --zap --cask yap
  CAVEAT
end
