# Mannafee/homebrew-tap

A Homebrew tap for [Zielzeit](https://github.com/Mannafee/zielzeit-scalable-capital) — a macOS menu
bar app that projects when your Scalable Capital portfolio will reach your goal.

```sh
brew install --cask mannafee/tap/zielzeit
```

Zielzeit's own audience already installs the official Scalable CLI this way
(`brew install scalable-cli`), which is why the app is offered here alongside the
[DMG](https://github.com/Mannafee/zielzeit-scalable-capital/releases/latest).

## What this does not do

**It does not get you past Gatekeeper.** Zielzeit is ad-hoc signed and not notarized —
notarization needs a paid Apple Developer account the project does not have — so the first launch
is refused either way, and `System Settings → Privacy & Security → Open Anyway` is still the step.
Homebrew is removing `--no-quarantine` and
[requires codesigning and notarization](https://github.com/Homebrew/brew/issues/20755) for casks in
its official tap from September 2026. The convenience here is one command and `brew upgrade`
knowing the app exists, not a security bypass.

## Updates

Zielzeit updates itself through Sparkle, so the cask is marked `auto_updates true` and you do not
need `brew upgrade` to stay current. The cask is bumped by `Scripts/release` in the app's own
repository, as part of cutting a release.

## Licence

The cask is MIT, matching Zielzeit itself.
