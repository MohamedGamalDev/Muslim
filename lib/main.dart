import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1907/Tabs/Hadith/hadith_details_screen.dart';
import 'package:test1907/Tabs/Quran/sura_details_sceen.dart';
import 'package:test1907/Tabs/Settings/settings_provider.dart';
import 'package:test1907/app_theme.dart';
import 'Home page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SettingsProvider settingsProvider = SettingsProvider();
  await settingsProvider.loadPreferences();

  runApp(
    ChangeNotifierProvider(
      create: (context) => settingsProvider,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.route: (context) => HomePage(),
        SuraDetailsScreen.route: (context) => SuraDetailsScreen(),
        HadithDetailsScreen.route: (context) => HadithDetailsScreen(),
      },
      theme: AppTheme.lightTheme,
      themeMode: settingsProvider.themeMode,
      darkTheme: AppTheme.darkTheme,
      locale: Locale(settingsProvider.language),
    );
  }
}
