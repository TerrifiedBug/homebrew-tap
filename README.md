# TerrifiedBug Homebrew Tap

Casks for TerrifiedBug's macOS menu-bar apps.

```bash
brew install --cask terrifiedbug/tap/komodobar   # Komodo control plane
brew install --cask terrifiedbug/tap/tickerbar   # menu-bar stock ticker
brew install --cask terrifiedbug/tap/spacebar    # named Space presets
```

These are unsigned (free) builds, so macOS quarantines them. After install, clear it:

```bash
xattr -dr com.apple.quarantine /Applications/SpaceBar.app   # or KomodoBar.app / TickerBar.app
```

(or right-click the app → **Open** the first time). These apps self-update via Sparkle.
