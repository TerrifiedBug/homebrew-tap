cask "komodobar" do
  version "0.1.2"
  sha256 "5fb59fc4239324419f44831f1335441eed42a0c50affbdac60d7614990a4cf3c"

  url "https://github.com/TerrifiedBug/KomodoBar/releases/download/v#{version}/KomodoBar-#{version}.zip"
  name "KomodoBar"
  desc "Menu-bar control plane for Komodo"
  homepage "https://github.com/TerrifiedBug/KomodoBar"

  # Installed under /Applications, where the app's Sparkle updater is active, so
  # let Homebrew defer to it rather than manage versions itself.
  auto_updates true

  # Unsigned build: after install, clear quarantine with
  # `xattr -dr com.apple.quarantine /Applications/KomodoBar.app`.
  app "KomodoBar.app"

  zap trash: "~/Library/Preferences/com.komodobar.app.plist"
end
