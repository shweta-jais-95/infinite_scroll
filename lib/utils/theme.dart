import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll/utils/fontsizes.dart';
import 'package:infinite_scroll/utils/palette.dart';

class AppTheme {
  static ThemeData getTheme(isDark) {
    return ThemeData(
        primaryColor: Palette.primaryColor,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        timePickerTheme: TimePickerThemeData(
            dialBackgroundColor: isDark ? Palette.dark2 : Palette.blue10,
            helpTextStyle: TextStyle(color: Palette.textColor),
            backgroundColor: isDark ? Palette.dark6 : Palette.whiteColor),
        //fontFamily: 'Lato',
        scaffoldBackgroundColor: isDark ? Palette.dark : Palette.bgColor,
        dividerColor: isDark ? Palette.grey70 : Palette.grey15,
        dialogBackgroundColor: isDark ? Palette.dark2 : Palette.whiteColor,
        unselectedWidgetColor: Palette.grey50,
        toggleableActiveColor: Palette.primaryColor,
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: isDark ? Palette.dark2 : Palette.primaryColor,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light),
            iconTheme: IconThemeData(color: Palette.primaryColor),
            backgroundColor: isDark ? Palette.dark : Palette.bgColor,
            elevation: 1,
            toolbarTextStyle: TextStyle(
                color: Palette.primaryColor,
                fontSize: FontSizes.subtitle1,
                fontWeight: FontWeight.w500),
            titleTextStyle: TextStyle(
                color: Palette.primaryColor,
                fontSize: FontSizes.subtitle1,
                //fontFamily: 'Lato',
                fontWeight: FontWeight.w500),
            actionsIconTheme: IconThemeData(color: Palette.primaryColor)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Palette.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Palette.primaryColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              backgroundColor: isDark ? Palette.decorumDark4 : Palette.blue10,
              padding:
                  const EdgeInsets.only(bottom: 4, left: 8, right: 8, top: 4),
              minimumSize: const Size(70, 30)),
        ),
        popupMenuTheme: PopupMenuThemeData(
            color: isDark ? Palette.dark6 : Palette.whiteColor,
            textStyle: TextStyle(color: Palette.textColor)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: isDark ? Palette.dark2 : Palette.whiteColor,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: FontSizes.caption),
            unselectedLabelStyle: const TextStyle(fontSize: FontSizes.caption),
            selectedIconTheme: IconThemeData(color: Palette.primaryColor),
            selectedItemColor: Palette.primaryColor,
            unselectedItemColor: Palette.grey50,
            unselectedIconTheme: IconThemeData(color: Palette.grey50),
            showSelectedLabels: true,
            showUnselectedLabels: true),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Palette.primaryColor,
          primary: Palette.primaryColor,
          onPrimary: Palette.whiteColor,
          surface: Palette.primaryColor,
          onSurface: Palette.textColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: isDark ? Palette.dark6 : Palette.whiteColor),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Palette.transparent,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isDark ? Palette.grey60 : Palette.grey30, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.primaryColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.errorColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.errorColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isDark ? Palette.grey90 : Palette.grey10, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          labelStyle: TextStyle(
              color: Palette.grey50,
              fontWeight: FontWeight.w400,
              fontSize: FontSizes.body1),
        ),
        dialogTheme: DialogTheme(
            backgroundColor: isDark ? Palette.dark2 : Palette.whiteColor),
        cardTheme: CardTheme(
            color: isDark ? Palette.dark6 : Palette.whiteColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))));
  }
}
