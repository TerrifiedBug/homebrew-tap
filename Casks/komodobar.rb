cask "komodobar" do
  version "0.1.1"
  sha256 "6b29b03b415f84ddb7f2b227ff2a7e8844c429f4dded4243e9aa8489b8402b59"

  url "https://github.com/TerrifiedBug/KomodoBar/releases/download/v#{version}/KomodoBar-#{version}.zip"
  name "KomodoBar"
  desc "Menu-bar control plane for Komodo"
  homepage "https://github.com/TerrifiedBug/KomodoBar"

  # Unsigned build: install with `--no-quarantine`, else Gatekeeper blocks it.
  # Cask installs run under /Caskroom, where the app disables Sparkle and lets
  # `brew upgrade` manage updates instead.
  app "KomodoBar.app"

  zap trash: "~/Library/Preferences/com.komodobar.app.plist"
end
