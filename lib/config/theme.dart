import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hodtech/core/utils/dims.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/string.dart';

var theme = HodTheme().light;

class HodTheme {
  static HodTheme? _instance;

  factory HodTheme() {
    return _instance ??= HodTheme._internal();
  }

  HodTheme._internal();

  var light = ThemeData(
    fontFamily: kFont,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: appColor.black,
        systemStatusBarContrastEnforced: false,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    iconTheme: IconThemeData(color: appColor.black),
    primaryColor: appColor.primary,
    scaffoldBackgroundColor: appColor.primary_800,
    drawerTheme: DrawerThemeData(
      backgroundColor: appColor.primary_800,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      surface: appColor.primary,
      secondary: appColor.black,
    ),
    disabledColor: const Color.fromRGBO(74, 85, 104, 1),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: appColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    ),
    // ignore: prefer_const_constructors
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textColor,
        letterSpacing: 0.8,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),

      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      // bodyText1: ,
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodySmall: bodySmall,
      displayMedium: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: textColor,
      ),
      displaySmall: displaySmall,
      labelSmall: TextStyle(
        fontSize: 12,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: textColor,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.only(top: 12),
      isCollapsed: true,
      // contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      isDense: true,
      fillColor: appColor.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        borderSide: BorderSide(
          color: appColor.primary,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appColor.grey_500,
          width: 1.0,
        ),
      ),

      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: appColor.white,
        ),
        borderRadius: BorderRadius.circular(
          Dims.inputRadius,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(
          Dims.inputRadius,
        ),
      ),
      hintStyle: TextStyle(
        color: appColor.grey_700,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: TextStyle(
        color: appColor.grey_700,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

get displaySmall => TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: appColor.black);

get bodySmall => TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textColor,
    );

get textColor => appColor.grey_900;
