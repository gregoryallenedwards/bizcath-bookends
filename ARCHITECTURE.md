# Architecture

Flutter and Dart 3, Android first. The pattern is MVVM, following Flutter's
architecture guide.

```
lib/
  main.dart
  app/            routing, theme, Today state machine
  ui/<feature>/   <feature>_screen.dart + <feature>_view_model.dart
  domain/models/  plain immutable data, no Flutter imports
  data/
    repositories/ the source of truth
    services/     database, notifications, widget bridge, clock, export
test/             mirrors lib/
android/          including the native widget code
```

## Rules

- A view talks only to its view model.
- View models hold repositories privately.
- Only repositories use services.
- Models are plain and immutable.
- Each view model and repository has a test file.
- No file is longer than 400 lines.

## Storage

Data is kept in a local database (drift). Repositories read it into memory at
start and write to the database before updating what they hold.
`lib/data/services/database.g.dart` is generated; it is exempt from the
400-line rule and is not edited by hand. Android backup is switched off.

## Time

All time-of-day logic reads the time from `ClockService`, so the debug menu can
override it. A day runs from 04:00 to 03:59 local time.

## Privacy

The release build declares no `INTERNET` permission. Nothing leaves the phone.
(Debug and profile builds have it, because Flutter's development tools need it.)
