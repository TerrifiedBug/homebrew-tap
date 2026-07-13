cask "tickerbar" do
  version "1.4.0"
  sha256 "85349a91e18894e98daa4e581edcc2c6410cba8502ad1424f0fed6828a60992a"

  url "https://github.com/TerrifiedBug/TickerBar/releases/download/v#{version}/TickerBar.zip"
  name "TickerBar"
  desc "Lightweight macOS menu bar stock ticker"
  homepage "https://github.com/TerrifiedBug/TickerBar"

  # Ad-hoc build self-updates via Sparkle, so let Homebrew defer to it.
  auto_updates true

  app "TickerBar.app"

  zap trash: "~/Library/Preferences/com.tickerbar.app.plist"
end
