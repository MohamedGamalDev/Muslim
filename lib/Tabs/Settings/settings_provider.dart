import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier
{
ThemeMode themeMode=ThemeMode.light;
String language='en';
bool get isDark =>themeMode==ThemeMode.dark;
String get backGroundImagePAth=> isDark?
'assets/images/dark_bg.png':'assets/images/default_bg.png';
void ChangeThemeMode(ThemeMode selectedThemeMode){
  themeMode=selectedThemeMode;
  notifyListeners();
}
void ChangeLanguage(String selectedLanguage)
{
  language=selectedLanguage;
  notifyListeners();

}

}