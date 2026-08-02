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

  # quit only. Deliberately no "launchctl:" here: Homebrew runs the
  # uninstall directives on upgrade as well, and that one deletes
  # ~/Library/LaunchAgents/<label>.plist outright, so every
  # "brew upgrade" would quietly switch launch-at-login off. The cask
  # does not create that agent either. "yap install --launch-at-login"
  # does — so removing it was never the cask's business.
  uninstall quit: "com.terrifiedbug.yap"

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
