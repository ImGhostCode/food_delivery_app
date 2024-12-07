import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Gilroy',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Gilroy',
    brightness: Brightness.dark,
    primaryColor: const Color(0xffff7269),
    scaffoldBackgroundColor: const Color(0xff2c2f38),
  );
}

class TextColors {
  static const Color primaryColor = Color(0xFF686F82); // Example color
  static const Color secondaryColor = Color(0xFF8E94A4);
  static const Color red = Color(0xFFFF7269);
}

class AppColors {
  static const Color secondaryColor = Color(0xFF353842);
  static const Color activeIconColor = Color(0xFFFF7269);
  static const Color iconColor = Color(0xFFA3A9BA);
  static const Color red = Color(0xFFFF7269);
}
