cask "tickerbar" do
  version "1.4.1"
  sha256 "6458e4ce61863aadfa15afd4866c20de6215e722b13998dc907012cd01a41538"

  url "https://github.com/TerrifiedBug/TickerBar/releases/download/v#{version}/TickerBar.zip"
  name "TickerBar"
  desc "Lightweight macOS menu bar stock ticker"
  homepage "https://github.com/TerrifiedBug/TickerBar"

  # Ad-hoc build self-updates via Sparkle, so let Homebrew defer to it.
  auto_updates true

  app "TickerBar.app"

  zap trash: "~/Library/Preferences/com.tickerbar.app.plist"
end
