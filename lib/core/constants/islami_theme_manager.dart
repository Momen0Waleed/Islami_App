import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';

abstract class IslamiThemeManager {
  static ThemeData islamiThemeData = ThemeData(
    primaryColor: IslamiColors.gold,
    scaffoldBackgroundColor: IslamiColors.black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: IslamiColors.gold),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        color: IslamiColors.gold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: IslamiColors.gold,
      selectedItemColor: IslamiColors.white,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        color: IslamiColors.white,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        fontFamily: "Janna",
      ),
      unselectedItemColor: IslamiColors.black,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        color: IslamiColors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        color: IslamiColors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        color: IslamiColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        color: IslamiColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        color: IslamiColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontFamily: "Janna",
        fontWeight: FontWeight.w700,
        color: IslamiColors.gold,
      ),
    ),
  );
}
