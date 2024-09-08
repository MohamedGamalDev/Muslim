import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = 'ar';

  bool get isDark => themeMode == ThemeMode.dark;
  String get backGroundImagePAth =>
      isDark ? 'assets/images/dark_bg.png' : 'assets/images/default_bg.png';

  // تعديل السمة وحفظها في SharedPreferences
  Future<void> ChangeThemeMode(ThemeMode selectedThemeMode) async {
    themeMode = selectedThemeMode;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', selectedThemeMode == ThemeMode.dark ? 'dark' : 'light');

    notifyListeners(); // تحديث الواجهة بعد تغيير السمة
  }

  // تغيير اللغة
  void ChangeLanguage(String selectedLanguage) {
    language = selectedLanguage;
    notifyListeners();
  }

  // تحميل القيم من SharedPreferences عند بدء التطبيق
  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // تحميل وضع السمة المخزنة
    String? savedTheme = prefs.getString('themeMode');
    if (savedTheme != null) {
      themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }

    // تحميل اللغة المخزنة
    language = prefs.getString('language') ?? 'en';

    notifyListeners(); // تحديث الواجهة بعد تحميل الإعدادات
  }
}
