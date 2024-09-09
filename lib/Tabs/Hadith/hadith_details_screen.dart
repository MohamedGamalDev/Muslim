import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1907/Tabs/Settings/settings_provider.dart';
import 'hadith_tab.dart';
import 'package:provider/provider.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String route = 'HadithDetailsScreen';
  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  late DataOfHadith arguments;
  Map<int, List<String>> HadithMap = {};
  List<String> CurrentHadithContent = [];
  List<String>ContentOfEachPart=[];
  String Lable = '';
  @override
  void initState() {
    super.initState();
    readFile();
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider=Provider.of<SettingsProvider>(context);
    arguments = ModalRoute.of(context)!.settings.arguments as DataOfHadith;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.backGroundImagePAth),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  color:Theme.of(context).canvasColor,
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
                                color: Theme.of(context).cardColor,
                                width: 1,
                              ))),
                   //   Theme.of(context).textTheme.titleLarge,
                      child: Text(
                        Lable,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02816,
                    ),
                    Expanded(
                      child:
                      // CurrentHadithContent.isEmpty?
                      //     Center(
                      //       child: CircularProgressIndicator(
                      //         color: Theme.of(context).cardColor,
                      //       ),
                      //     )
                      // :
                      ListView.builder(
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            CurrentHadithContent[index],
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        itemCount: CurrentHadithContent.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> readFile()async
  {
    String AllTextOfFillAhadeth =await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String>AllPartsOfFillAhadeth=AllTextOfFillAhadeth.split('#').where((element) => element.trim().isNotEmpty).toList();
    for(int i =0;i<AllPartsOfFillAhadeth.length;i++)
    {
      ContentOfEachPart=AllPartsOfFillAhadeth[i].split('\r\n').where((element) =>element.trim().isNotEmpty).toList();
      HadithMap[i]=ContentOfEachPart;
    }
    List<String>content = HadithMap[arguments.currentIndex]!;
    Lable=content.first;
    CurrentHadithContent=content.skip(1).toList();
    setState(() {

    });
  }
}

