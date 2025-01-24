import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static const TextTheme _textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: "Metropolis"),
    headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: "Metropolis"),
    titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: "Metropolis"),
    headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: "Metropolis"),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: "Metropolis"),
    // Body Text
    bodyLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, fontFamily: "Metropolis"),
    bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: "Metropolis"),
    bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: "Metropolis"),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: "Metropolis"),
    // Caps
    // Caps
    labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500, fontFamily: "Metropolis"),
  );

  static ThemeData defaultTheme = ThemeData(
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor600),
    textTheme: _textTheme,
  );
}
