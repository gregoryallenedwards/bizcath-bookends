// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

ThemeData _wireframe(Brightness brightness) {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF808080),
    brightness: brightness,
    dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
  );
  return ThemeData(
    colorScheme: scheme,
    // Keeps every control at least 48 dp.
    materialTapTargetSize: MaterialTapTargetSize.padded,
  );
}

/// Light, by day.
final ThemeData dayTheme = _wireframe(Brightness.light);

/// Dark grey, for the evening and the night.
final ThemeData eveningTheme = _wireframe(Brightness.dark);
