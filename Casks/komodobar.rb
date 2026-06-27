cask "komodobar" do
  version "0.2.0"
  sha256 "939cdb448981c64c921873ccf76e645587bea9608bc77cbf0d5e63a11cca7b6c"

  url "https://github.com/TerrifiedBug/KomodoBar/releases/download/v#{version}/KomodoBar-#{version}.zip"
  name "KomodoBar"
  desc "Menu-bar control plane for Komodo"
  homepage "https://github.com/TerrifiedBug/KomodoBar"

  # Unsigned build: after install, clear quarantine with
  # `xattr -dr com.apple.quarantine /Applications/KomodoBar.app`.
  auto_updates true
  app "KomodoBar.app"
end
