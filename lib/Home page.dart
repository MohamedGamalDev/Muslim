import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1907/Tabs/Hadith/hadith_tab.dart';
import 'package:test1907/Tabs/Quran/quran_tab.dart';
import 'package:test1907/Tabs/Radio/radio_tab.dart';
import 'package:test1907/Tabs/Sabha/sebha_tab.dart';
import 'package:test1907/Tabs/Settings/settings_provider.dart';
import 'package:test1907/Tabs/Settings/settings_tab.dart';
import 'package:test1907/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomePage extends StatefulWidget {
  static const String route='/';
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<Widget>tabs=[
    SettingsTab(),
    RadioTab(),
    SebhaTab(),
    HadithTab(),
    QuranTab(),
  ];
  int number=0;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider=Provider.of<SettingsProvider>(context);
    return Container(
      decoration:BoxDecoration(image: DecorationImage(image:
      AssetImage(settingsProvider.backGroundImagePAth)
      ,fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami)),
        body:tabs[number] ,
        bottomNavigationBar:SizedBox(
          height: MediaQuery.of(context).size.height*.08,
          child: BottomNavigationBar(
            currentIndex: number,
              onTap: (value) {
                number=value;
                setState(() {
                });
              },
              items: [
                BottomNavigationBarItem(icon:Icon(Icons.settings_outlined),
                    label: 'Settings'
                ),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_radio.png')
                ),
                  label:'Radio',
                ),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')
                ),
                  label:'Sebha',
                ),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label:'Hadeth',
                ),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_quran.png')
                ),
                  label:'Quran',
                ),
              ]),
        ),

      ),
    );
  }
}