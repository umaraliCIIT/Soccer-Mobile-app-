import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryColor600 = Color(0xFFF3AB3C);
  static Color primaryColor300 = fromHex('#F3AB3C40');

  static const Color secondaryColor600 = Color(0xFF858A9D);
  static const Color secondaryColor500 = Color(0xFFBDC1CF);
  static const Color secondaryColor450 = Color(0xFF1F1D28);
  static const Color secondaryColor400 = Color(0xFFD9DADF);
  static const Color secondaryColor350 = Color(0xFF1E1C25);
  static const Color secondaryColor300 = Color(0xFFADB1C4);
  static Color secondaryColor250 = fromHex('#BDC1CF80');
  static const Color secondaryColor200 = Color(0xFF8B8993);
  static const Color secondaryColor150 = Color(0xFFD0D4E1);
  // static const Color secondaryColor100 = Color(0xFFF3AB3C);
  static const Color secondaryColor50 = Color(0xFF25AAE2);
  static const Color secondaryColor25 = Color(0xFFE1E2E5);

  // Neutral Colors
  static const Color neutralColor600 = Color(0xFF27282c);
  static const Color neutralColor500 = Color(0xFF68696b);
  static const Color neutralColor400 = Color(0xFF46415A);

  // AttentionColors
  static const Color errorColor500 = Color(0xFFDC2626);

  // Action Colors
  static const Color actionColor600 = Color(0xFF15141D);
  static const Color actionColor550 = Color(0xFF12101A);
  static const Color actionColor500 = Color(0xFF0C0A12);

  // Old Colors
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color whiteColor75 = Color(0xFFFFFFBF);
  static Color whiteColor50 = fromHex('#FFFFFF99');
  static const Color blackColor = Color(0xFF14142B);
  static const Color black = Color(0x00000099);
  static const Color blackColor500 = Color(0xFF161221);
  static const Color fillColor = Color(0xFF201d28);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
