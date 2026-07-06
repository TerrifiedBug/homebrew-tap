cask "spacebar" do
  version "0.1.0"
  sha256 "f29a0c8f4f6cfa353c1f94f6b78dd377f89ab8dbdcea69a6ccf853120598dd4c"

  url "https://github.com/TerrifiedBug/spacebar/releases/download/v#{version}/SpaceBar-#{version}.zip"
  name "SpaceBar"
  desc "Named Space presets in your menu bar"
  homepage "https://github.com/TerrifiedBug/spacebar"

  # Unsigned build: after install, clear quarantine with
  # `xattr -dr com.apple.quarantine /Applications/SpaceBar.app`.
  auto_updates true
  app "SpaceBar.app"
end
