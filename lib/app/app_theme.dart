import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF1E3A8A);
  static const Color accentRed = Color(0xFFDC2626);
  static const Color surfaceWhite = Color(0xFFF8FAFC);

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: Brightness.light,
    ).copyWith(
      primary: primaryBlue,
      secondary: accentRed,
      surface: surfaceWhite,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: Brightness.dark,
    ).copyWith(
      primary: primaryBlue,
      secondary: accentRed,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
