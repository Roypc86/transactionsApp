import 'package:flutter/material.dart';

/// Centralized Material 3 theme configuration for the app.
abstract final class AppTheme {
  static const Color _seedColor = Color(0xFF1B4332);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: _seedColor,
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: _seedColor,
  );
}
