import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1907/Tabs/Settings/settings_provider.dart';
import 'package:test1907/app_theme.dart';
class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider=Provider.of<SettingsProvider>(context);
    return Container(
      color:Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height:20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode',style: Theme.of(context).textTheme.headlineSmall,),
                Switch(value: settingsProvider.isDark,
                    onChanged: (isDark) =>settingsProvider.ChangeThemeMode(isDark? ThemeMode.dark:ThemeMode.light) ,
                  activeTrackColor:Theme.of(context).cardColor ,
                  inactiveTrackColor:Theme.of(context).canvasColor ,
                )
              ],
            ),
        SizedBox(height: 8,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('language',style: Theme.of(context).textTheme.headlineSmall,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: settingsProvider.language,
                items:[
                  DropdownMenuItem(child: Text("العربية",style: Theme.of(context).textTheme.headlineSmall,),value: 'ar',),
                  DropdownMenuItem(child: Text("English",style: Theme.of(context).textTheme.headlineSmall,),value: 'en',),
                ] ,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                onChanged: (selectedLanguage) {
                  settingsProvider.ChangeLanguage(selectedLanguage!);
              },),
            ),
          )
        ],
        ),],
        ),
      ),
    );
  }
}
