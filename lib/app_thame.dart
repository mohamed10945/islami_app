import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color white = Color(0xFFF8F8F8);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    dividerColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: black,
      titleTextStyle:
          TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: black),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: black,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
        headlineLarge:
            TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: black),
        headlineSmall:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: black)),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    dividerColor: gold,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: white,
      titleTextStyle:
          TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: white),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: gold,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
        headlineLarge:
            TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: white),
        headlineSmall:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: gold)),
  );
}
