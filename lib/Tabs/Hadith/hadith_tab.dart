import 'package:flutter/material.dart';
import 'package:test1907/Tabs/Hadith/hadith_details_screen.dart';
class HadithTab extends StatelessWidget {
  List<int> NumburOfHadeth = List.generate(50, (index) => (index+ 1));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.74,
            height: MediaQuery.of(context).size.height*0.268,
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.12 ,
                MediaQuery.of(context).size.height*0.02,
                MediaQuery.of(context).size.width*0.12,
                0 ),
            child: Image(image:AssetImage('assets/images/hadeth_logo.png') ),
          ),
          Container(
            decoration: BoxDecoration(border:
            Border(
                bottom: BorderSide(   color:Theme.of(context).cardColor,width: 3),
                top:BorderSide(   color:Theme.of(context).cardColor,width: 3)
            )
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.06,
            margin: EdgeInsets.fromLTRB(0 , 0, 0,
                MediaQuery.of(context).size.height*0.017 ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('الأحاديث',textAlign: TextAlign.center,style:Theme.of(context).textTheme.headlineSmall,),
              ],
            ),
          ),
       Expanded(child: ListView.builder(
           itemBuilder: (context, index) {
             return Container(
               margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.35 ,
                   MediaQuery.of(context).size.height*0.02,
                   MediaQuery.of(context).size.width*0.29,
                   0 ),
               child: InkWell(onTap:() => Navigator.of(context).pushNamed(HadithDetailsScreen.route,arguments:DataOfHadith(currentIndex: index,TotalNumburOfHadeth: NumburOfHadeth.length) ),
                   child: Text('${NumburOfHadeth[index]} الحديث رقم ',
                     textAlign: TextAlign.center,
                     style:Theme.of(context).textTheme.headlineSmall,)),
             );
           },
       itemCount:NumburOfHadeth.length ,)
       )
        ],
      ),
    );
  }
}
class DataOfHadith
{
  int TotalNumburOfHadeth;
int currentIndex;
DataOfHadith({required this.currentIndex,required this.TotalNumburOfHadeth});
}
