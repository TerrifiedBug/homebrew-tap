cask "browseroute" do
  version "0.2.0"
  sha256 "7f4a95f977a585fa989faaf3f3723376d6853192b7b508e1b6652ba7a727349b"

  url "https://github.com/TerrifiedBug/browseroute/releases/download/v#{version}/Browseroute-#{version}.zip"
  name "Browseroute"
  desc "Route each link to the browser you choose"
  homepage "https://github.com/TerrifiedBug/browseroute"

  # Signed and notarized. Opens from Applications with no Gatekeeper prompt.
  # A bare symbol is the minimum version. The ">= :sonoma" string
  # form is deprecated and warns on every brew install.
  depends_on macos: :sonoma

  app "Browseroute.app"

  zap trash: [
    "~/Library/Preferences/com.terrifiedbug.browseroute.plist",
  ]
end
