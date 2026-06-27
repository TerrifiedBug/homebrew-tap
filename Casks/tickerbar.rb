cask "tickerbar" do
  version "1.3.0"
  sha256 "fc1306563ba8a8501ddff8610ce3fca327daa1cd390e6e4ea6dc3d761707e212"

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
