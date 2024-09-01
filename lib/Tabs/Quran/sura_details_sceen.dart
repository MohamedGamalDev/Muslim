import 'package:flutter/material.dart';
import 'package:test1907/Tabs/Quran/quran_tab.dart';
import 'package:test1907/app_theme.dart';
class SuraDetailsScreen extends StatelessWidget {
  static const String route='SuraDetailsScreen';
  List<String>ayat=[
    'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    ' الرَّحْمَنِ الرَّحِيمِ',
    'مَالِكِ يَوْمِ الدِّينِ',
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين',
  ];
  @override
  Widget build(BuildContext context) {
    SuraDetails arguments=ModalRoute.of(context)!.settings.arguments as SuraDetails;
    return Container(
 decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/images/default_bg.png'
 ),fit: BoxFit.fill
 )

 ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
        ),
        body: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height*0.0632 ,),
Center(
  child: Container(
    height:MediaQuery.of(context).size.height*0.75 ,
    width:MediaQuery.of(context).size.width*0.86,
    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),color: AppTheme.white,
    ),
    child:Column(
      children: [
        SizedBox(height:MediaQuery.of(context).size.height*0.0448 ,),
        Container(
          width:MediaQuery.of(context).size.width*0.65,
        decoration: BoxDecoration(border: Border(
          bottom: BorderSide(
            color: AppTheme.lightPrimary,
            width: 1,
          )
        )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: Text(' سورة ${arguments.curruntName}',style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,),
              ),
              Icon(Icons.play_circle_fill_outlined),
            ],
          ),
        ),
       SizedBox(height:MediaQuery.of(context).size.height*0.02816 ,),
       Expanded(child: ListView.builder(itemBuilder: (context, index) => Text('${ayat[index]} ( ${index+1} )',style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center), itemCount: ayat.length))
      ],
    ) ,
  ),
)
          ],
        ),
      ),
    );
  }
}
