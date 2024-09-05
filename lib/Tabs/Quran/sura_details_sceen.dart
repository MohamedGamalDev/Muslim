import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1907/Tabs/Quran/quran_tab.dart';
import 'package:test1907/app_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String route = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraDetails arguments;
  List<String> ayat = [];

  //@override
  void initState() {
    super.initState();
    // Load the Sura file when the screen is initialized
    loadSuraFile();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as SuraDetails;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0632,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: AppTheme.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0448,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: AppTheme.lightPrimary,
                                width: 1,
                              ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                            child: Text(
                              ' سورة ${arguments.curruntName}',
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Icon(Icons.play_circle_fill_outlined),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02816,
                    ),
                    Expanded(
                        child: ayat.isEmpty? Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.gold,
                          ),
                        ):
                        ListView.builder(
                            itemBuilder: (context, index) => Container(
                              child: Container(
                               margin: EdgeInsets.fromLTRB(3, 5, 3, 5),
                                child: Text(
                                    '${ayat[index]} ( ${index+1} )',
                                    style: Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            itemCount: ayat.length))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void loadSuraFile() async {
    await Future.delayed(Duration(seconds: 1));
    String sura = await rootBundle.loadString('assets/files/${arguments.currintIndex + 1}.txt');
    ayat=sura.split('\r\n').where((element) => element.trim().isNotEmpty,).toList();
    setState(() {});
  }
}
