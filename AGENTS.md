# Rules for AI agents

## Source of truth

- Build from `docs/SPEC.md`, `docs/DESIGN_LOG.md` and
  `docs/Bookends-Major-Screens.pdf` only.
- Do not research, download, open or describe other apps in this category, and
  do not use anything you remember about how any existing wellbeing, habit,
  meditation or quote app works. If something is unclear, ask the owner; do not
  fill the gap by imitating an existing app.

## Content

- All words are placeholders from the spec. Do not add quotes from memory.
- Everything visual is a wireframe. No art, illustrations, icons from other
  apps, fonts other than the system font, or sounds. No brand art.
- Screenshots go in pull requests only, and show only this app.

## Code

- Follow `ARCHITECTURE.md`.
- Dependencies must be open source under a permissive licence (MIT, BSD,
  Apache-2.0). No Google Play services, Firebase, analytics, crash reporters or
  ads.
- The release build declares no `INTERNET` permission.
- Each source file carries the line "Copyright the BizCath contributors."
- Before finishing: `dart format`, `flutter analyze` with no issues, and
  `flutter test` with everything passing.

## Process

- One branch and one pull request per milestone. The owner merges.
- Ask the owner before anything a new commit cannot undo: force-pushes,
  deleting branches, merging, publishing or spending money.
