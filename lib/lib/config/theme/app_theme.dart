import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static const TextTheme _textTheme = TextTheme(
    // Headings
    // Subheadings
    headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
    headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
    titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
    headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
    // Body Text
    bodyLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
    bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
    bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
    // Caps
    labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
  );

  static ThemeData defaultTheme = ThemeData(
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor600),
    textTheme: _textTheme,
  );
}
