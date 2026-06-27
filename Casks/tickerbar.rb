cask "tickerbar" do
  version "1.3.1"
  sha256 "d5f9ee7edb3eafbadd97b7029f479ae9fe1f41be1d5181d8199fc6104e2b0964"

  url "https://github.com/TerrifiedBug/TickerBar/releases/download/v#{version}/TickerBar.zip"
  name "TickerBar"
  desc "Lightweight macOS menu bar stock ticker"
  homepage "https://github.com/TerrifiedBug/TickerBar"

  # Developer-ID signed + notarized; self-updates via Sparkle, so let Homebrew
  # defer to it rather than manage versions itself.
  auto_updates true

  app "TickerBar.app"

  zap trash: "~/Library/Preferences/com.tickerbar.app.plist"
end
