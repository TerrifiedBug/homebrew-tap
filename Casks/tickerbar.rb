cask "tickerbar" do
  version "1.5.1"
  sha256 "8055cd543bf52a29a710037ac2b65cf247b0eea9f99d0ce6e23795cf0d159aeb"

  url "https://github.com/TerrifiedBug/tickerbar/releases/download/v#{version}/tickerbar.zip"
  name "TickerBar"
  desc "Lightweight macOS menu bar stock ticker"
  homepage "https://github.com/TerrifiedBug/tickerbar"

  # Signed, notarized, and self-updating via Sparkle.
  auto_updates true

  app "TickerBar.app"

  zap trash: [
    "~/Library/Caches/com.tickerbar.app",
    "~/Library/HTTPStorages/com.tickerbar.app",
    "~/Library/Preferences/com.tickerbar.app.plist",
  ]
end
