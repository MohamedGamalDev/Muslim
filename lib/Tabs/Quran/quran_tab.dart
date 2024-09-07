import 'package:flutter/material.dart';
import 'package:test1907/Tabs/Quran/sura_details_sceen.dart';
import 'package:test1907/app_theme.dart';
class QuranTab extends StatelessWidget {
  List<String> quranNames = [
    "الفاتحة",
    "البقرة",
    'آل عمران',
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النور",
    "الفرقان",
    "الشعراء",
    "النمل",
    "القصص",
    "العنكبوت",
    "الروم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزمل",
    "المدثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  List<String> quranAyatNumbers = [
    "7",
    "286",
    "200",
    "176",
    "120",
    "165",
    "206",
    "75",
    "129",
    "109",
    "123",
    "111",
    "43",
    "52",
    "99",
    "128",
    "111",
    "110",
    "98",
    "135",
    "112",
    "78",
    "118",
    "64",
    "77",
    "227",
    "93",
    "88",
    "69",
    "60",
    "34",
    "30",
    "73",
    "54",
    "45",
    "83",
    "182",
    "88",
    "31",
    "85",
    "54",
    "53",
    "89",
    "59",
    "37",
    "35",
    "64",
    "29",
    "18",
    "45",
    "30",
    "49",
    "62",
    "55",
    "78",
    "96",
    "29",
    "22",
    "24",
    "13",
    "14",
    "11",
    "11",
    "18",
    "12",
    "12",
    "30",
    "52",
    "52",
    "44",
    "28",
    "28",
    "20",
    "56",
    "40",
    "31",
    "50",
    "40",
    "46",
    "42",
    "29",
    "19",
    "36",
    "25",
    "22",
    "17",
    "19",
    "26",
    "30",
    "20",
    "15",
    "21",
    "11",
    "8",
    "8",
    "19",
    "5",
    "8",
    "8",
    "11",
    "11",
    "8",
    "3",
    "9",
    "5",
    "4",
    "7",
    "3",
    "6",
    "3",
    "5",
    "4",
    "5",
    "6",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/qur2an_screen_logo.png',
          height: MediaQuery.of(context).size.height * 0.26,
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:Theme.of(context).cardColor,
                      width: 3,
                    ),
                    top: BorderSide(
                      color:Theme.of(context).cardColor,
                      width: 3,
                    ),
                    right: BorderSide(
                      color:Theme.of(context).cardColor,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  'عدد الآيات',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide.none,
                    bottom: BorderSide(
                      color:Theme.of(context).cardColor,
                      width: 3,
                    ),
                    top: BorderSide(
                      color:Theme.of(context).cardColor,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  'اسم السورة',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: quranNames.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child:  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color:Theme.of(context).cardColor,
                            width: 3,
                          ),
                        ),
                      ),
                      child: Center(
                          child: Text(
                            quranAyatNumbers[index],
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap:()=>Navigator.of(context).pushNamed(SuraDetailsScreen.route
                              ,arguments:SuraDetails(currintIndex: index, curruntName:quranNames[index] ) ),
                          child: Text(
                            quranNames[index],
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
class SuraDetails
{
  int currintIndex;
  String curruntName;
  SuraDetails({
    required this.currintIndex,
  required this.curruntName
});
}