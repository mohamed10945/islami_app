import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = "ar";

  bool get isDark => themeMode == ThemeMode.dark;

  String get backgroundImageName => isDark ? "dark_bg" : "default_bg";
  String get SebhaBody => isDark ? "body_sebha_dark" : "body_sebha_logo";
  String get SebhaHead => isDark ? "head_sebha_dark" : "head_sebha_logo";


  void changeThemeMode(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void ChangeLanguage(String selectedlanguage) {
    if(selectedlanguage == languageCode) return;
    languageCode = selectedlanguage;
    notifyListeners();
  }
}
