cask "komodobar" do
  version "0.1.0"
  sha256 "af86fe5e53b0d44b97847a992f209eda8ca9ae60581e49282b400799fcaa810e"

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
