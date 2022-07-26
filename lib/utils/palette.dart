import 'package:flutter/material.dart';

class Palette {
  static const bgColor = Colors.white;
  static const dark = Color(0xFF1A1A1A);
  static const dark2 = Color(0xFF2A2A2A);
  static const dark4 = Color(0xFF2F2F2F);
  static const dark6 = Color(0xFF333333);
  static Color primary70 = Colors.blue.shade700;
  static Color primary100 = Colors.blue.shade100;
  static Color blue10 = Colors.blue.shade200;
  static const decorumDark4 = Color(0xFF2F2F2F);
  static Color primaryColor = Colors.blue;
  static const transparentColor = Color(0xB2000000);
  static Color loginBgColor = const Color(0xFF16A4B5);
  static const Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color errorColor = const Color(0xFFdc4e42);
  static Color textColor = const Color(0xFF1A1A1A);
  static Color iconColor = Colors.black87;
  static Color fabIconColor = Colors.white;
  static Color fabBgColor = const Color(0xFF5274B9);
  static Color fabIconTextColor = Colors.white;
  static Color grey300 = const Color(0xFFD6D6D6);
  static Color grey90 = const Color(0xFF1A1A1A);
  static Color grey80 = const Color(0xFF333333);
  static Color grey70 = const Color(0xFF4C4C4C);
  static Color grey60 = const Color(0xFF666666);
  static Color grey50 = const Color(0xFF808080);
  static Color grey40 = const Color(0xFF999999);
  static Color grey30 = const Color(0xFFB3B3B3);
  static Color grey20 = const Color(0xFFCCCCCC);
  static const Color grey15 = Color(0xFFE0E0E0);
  static Color grey10 = const Color(0xFFE5E5E5);
  static Color grey12 = const Color(0xFFE0E0E0);
  static Color grey3 = const Color(0xFFF7F7F7);
  static Color dark12Color = const Color(0xFF3A3A3A);
  static Color loadingViewBgColor = const Color(0xFFE5E5E5);
  static Color transparent = Colors.transparent;

  static setColor(bool isDark) {
    grey50 = const Color(0xFF808080);
    errorColor = const Color(0xFFdc4e42);

    if (isDark) {
      primaryColor = primary70;
      textColor = whiteColor;
      iconColor = whiteColor;
      fabIconColor = blackColor;
      fabIconTextColor = blackColor;
      fabBgColor = const Color(0xFF869ECE);
      loadingViewBgColor = dark;
    } else {
      loadingViewBgColor = bgColor;
      primaryColor = primary100;
      fabIconColor = whiteColor;
      textColor = const Color(0xFF1A1A1A);
      iconColor = Colors.black87;
      fabIconTextColor = whiteColor;
      fabIconColor = whiteColor;
      fabBgColor = const Color(0xFF5274B9);
    }
  }
}
