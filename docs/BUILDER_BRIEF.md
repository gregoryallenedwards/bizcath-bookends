# Builder brief: BizCath Bookends wireframe prototype

For: a new Claude Code session on the owner's Mac, opened in the `bizcath-bookends` repository.
Date: 26 November 2026.

## Your role

You are the **builder**. You build the app described in `docs/SPEC.md`, using only that file,
`docs/DESIGN_LOG.md` and `docs/Bookends-Major-Screens.pdf`. Read all three before you start.

- Do not research, download, open or describe other apps of this kind, and do not draw on what
  you remember about any existing wellbeing, habit, meditation or quote app. If the spec leaves
  something open, ask the owner.
- Do not add real quotes, art, fonts or sounds. Everything is a wireframe with placeholder words.
- Screenshots go in pull-request descriptions and show only this app.

## Before you start (with the owner)

1. Check the toolchain: `flutter doctor -v` should show Flutter stable, the Android toolchain
   and Java 17 as ready. Fix anything missing with the owner's agreement.
2. Connect the Android phone over USB with developer options and USB debugging on; `adb devices`
   should list it.
3. Confirm the repository is private and empty apart from `docs/`.

## How to work

- Follow section 13 of the spec for the repository setup first: `README.md`, `ARCHITECTURE.md`,
  `AGENTS.md`, `LICENSE` (Apache-2.0), `NOTICE`.
- Work milestone by milestone (spec section 12): M1, M2, M3, M4. One branch and one pull request
  per milestone. The owner merges.
- At the end of each milestone:
  1. `dart format`, `flutter analyze` (no issues) and `flutter test` (all pass).
  2. `flutter build apk --debug`, then `adb install -r build/app/outputs/flutter-apk/app-debug.apk`.
  3. Check the acceptance criteria for the milestone on the phone.
  4. Write a short report in the pull request: what was built, what was tested and how, what was
     not done, screenshots of this app only.
- Ask the owner before anything that cannot be undone by a new commit: force-pushes, deleting
  branches, merging, publishing, or spending money.
- Never add analytics, crash reporting, ads, Google Play services or Firebase, and keep the
  release build free of the `INTERNET` permission.

## When you're done

Report the four pull requests, the final APK path, and any questions or gaps in the spec. The
owner will pass questions back to the orchestrator, who updates the spec and design log.
