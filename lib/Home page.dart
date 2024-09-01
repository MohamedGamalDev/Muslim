import 'package:flutter/material.dart';
import 'package:test1907/Tabs/Hadith/hadith_tab.dart';
import 'package:test1907/Tabs/Quran/quran_tab.dart';
import 'package:test1907/Tabs/Radio/radio_tab.dart';
import 'package:test1907/Tabs/Sabha/sebha_tab.dart';
import 'package:test1907/Tabs/Settings/settings_tab.dart';
import 'package:test1907/app_theme.dart';
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
    return Container(
      decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/default_bg.png')
      ,fit: BoxFit.fill)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي',)),
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