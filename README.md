# TerrifiedBug Homebrew Tap

Casks for TerrifiedBug's macOS menu-bar apps.

```bash
brew install --cask --no-quarantine terrifiedbug/tap/komodobar   # Komodo control plane
brew install --cask --no-quarantine terrifiedbug/tap/tickerbar   # menu-bar stock ticker
```

`--no-quarantine` is required because these are unsigned (free) builds; without it
Gatekeeper blocks them. Both apps self-update via Sparkle after install.
