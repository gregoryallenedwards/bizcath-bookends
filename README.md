# BizCath Bookends

A free, open-source daily ritual app for adults: a short morning moment with
Toast (a sun) and a short evening moment with Cocoa (a moon).

This is a wireframe prototype for Android. Everything visual and every word in
it is a placeholder. Bookends is not a medical or crisis service.

The product is described in [docs/SPEC.md](docs/SPEC.md).

## Status

Milestone 1 of 4: project setup, navigation, Today's four states and a debug
clock. Days are not yet stored.

## Build

You need Flutter (stable), Java 17 and the Android SDK. Android 8.0 (API 26) or
later.

```bash
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
adb install -r build/app/outputs/flutter-apk/app-debug.apk
```

In a debug build, open Settings → About Bookends and long-press the version to
reach the debug menu.

## Licence

Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
