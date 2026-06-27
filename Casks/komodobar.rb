cask "komodobar" do
  version "0.1.3"
  sha256 "d7042e6047fa9232663eb43226e39cc85da23cb38446c081e055dffdbe445d15"

  url "https://github.com/TerrifiedBug/KomodoBar/releases/download/v#{version}/KomodoBar-#{version}.zip"
  name "KomodoBar"
  desc "Menu-bar control plane for Komodo"
  homepage "https://github.com/TerrifiedBug/KomodoBar"

  # Unsigned build: after install, clear quarantine with
  # `xattr -dr com.apple.quarantine /Applications/KomodoBar.app`.
  auto_updates true
  app "KomodoBar.app"
end
