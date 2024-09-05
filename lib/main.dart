import 'package:flutter/material.dart';
import 'package:test1907/Tabs/Hadith/hadith_details_screen.dart';
import 'package:test1907/Tabs/Quran/sura_details_sceen.dart';
import 'package:test1907/app_theme.dart';
import 'Home page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      routes:
      {
        HomePage.route:(context) => HomePage(),
        SuraDetailsScreen.route:(context)=>SuraDetailsScreen(),
        HadithDetailsScreen.route:(context)=>HadithDetailsScreen(),
      },
      theme:AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
