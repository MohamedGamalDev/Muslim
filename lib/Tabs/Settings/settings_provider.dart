import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = 'ar';

  bool get isDark => themeMode == ThemeMode.dark;
  String get backGroundImagePAth =>
      isDark ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png';

  Future<void> ChangeThemeMode(ThemeMode selectedThemeMode) async {
    themeMode = selectedThemeMode;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', selectedThemeMode == ThemeMode.dark ? 'dark' : 'light');

    notifyListeners();
  }


  void ChangeLanguage(String selectedLanguage) {
    language = selectedLanguage;
    notifyListeners();
  }


  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    String? savedTheme = prefs.getString('themeMode');
    if (savedTheme != null) {
      themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }


    language = prefs.getString('language') ?? 'en';

    notifyListeners();
  }
}
