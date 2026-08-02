cask "tickerbar" do
  version "1.5.0"
  sha256 "abec0db72e7bd65a399906e37e794cdbf034aff40162a937862eaabc6a473d0f"

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
