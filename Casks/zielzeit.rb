cask "zielzeit" do
  version "1.4"
  sha256 "ce08633b52cd08b4c7df9dd46d77245f79705ca669d315c1594ee201a7068e5a"

  # The versioned asset, not the stable `Zielzeit.dmg` alias the README links. Both
  # are the same build, published twice so the "latest download" URL can stay
  # stable, but a cask needs a URL that changes with the version or `brew` cannot
  # tell an upgrade from a reinstall.
  url "https://github.com/Mannafee/zielzeit-scalable-capital/releases/download/v#{version}/Zielzeit-#{version}.dmg",
      verified: "github.com/Mannafee/zielzeit-scalable-capital/"
  name "Zielzeit"
  desc "Menu bar app projecting when a Scalable Capital portfolio reaches a goal"
  homepage "https://github.com/Mannafee/zielzeit-scalable-capital/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Zielzeit updates itself through Sparkle, so `brew upgrade` is not the channel
  # and should not be surprised to find a newer version than the cask names.
  auto_updates true
  # Package.swift's platform and Info.plist's LSMinimumSystemVersion both say 15.
  depends_on macos: :sequoia

  app "Zielzeit.app"

  # The three UserDefaults keys (goal, language, hasRequestedAccess) all live in
  # this one domain. Nothing else is written: no figures, no session, no token.
  zap trash: [
    "~/Library/Application Support/Caches/com.zielzeit.Zielzeit",
    "~/Library/Caches/com.zielzeit.Zielzeit",
    "~/Library/Caches/com.zielzeit.Zielzeit.ShipIt",
    "~/Library/Preferences/com.zielzeit.Zielzeit.plist",
  ]

  caveats do
    <<~EOS
      Zielzeit is signed but not notarized, so macOS will refuse the first launch:
      "cannot be opened because Apple cannot check it for malicious software."
      Nothing is wrong with the download — notarization needs a paid Apple
      Developer account this free project does not have.

      To open it the first time:

        System Settings -> Privacy & Security -> scroll down -> Open Anyway

      Zielzeit then needs the official Scalable CLI, which it walks you through
      on first launch:

        brew tap ScalableCapital/tap && brew install scalable-cli

      The CLI is in beta and gated, so Scalable Capital has to allowlist you
      before you can log in. The app reads your installation code and drafts the
      email for you. Send it from the address registered with Scalable Capital,
      or it will never be answered.
    EOS
  end
end
