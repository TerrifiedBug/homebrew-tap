cask "browseroute" do
  version "0.1.0"
  sha256 "dc3cea602636f9917af090e7e469e18f2db13c011df33c92d131c9cc64226ed9"

  url "https://github.com/TerrifiedBug/browseroute/releases/download/v#{version}/Browseroute-#{version}.zip"
  name "Browseroute"
  desc "Route each link to the browser you choose"
  homepage "https://github.com/TerrifiedBug/browseroute"

  # Signed and notarized. Opens from Applications with no Gatekeeper prompt.
  depends_on macos: ">= :sonoma"

  app "Browseroute.app"

  zap trash: [
    "~/Library/Preferences/com.terrifiedbug.browseroute.plist",
  ]
end
