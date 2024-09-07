import 'package:flutter/material.dart';
import 'package:test1907/app_theme.dart';
class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String>Sebha=['سبحان الله','الحمد لله','لا إله إلا الله','الله اكبر'];
  int numberOfClicks=0;
  int numberOfList=0;
  int numberOfCompletedRound=0;
  void add()
  {
    setState(() {
      numberOfClicks++;
      if (numberOfClicks==34)
        {
          numberOfClicks=0;
          numberOfList++;
          if(numberOfList==4)
            {
              numberOfList=0;
              numberOfCompletedRound++;
            }
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Container(
            margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.115, MediaQuery.of(context).size.height*0, MediaQuery.of(context).size.width*.115, MediaQuery.of(context).size.height*0),
            child: GestureDetector(
              onTap: () =>add(),
                child:Image(
                       image: AssetImage('assets/images/Csepha.png'), color:Theme.of(context).cardColor,
                     )
            ),
          ),
         Text('عدد التسبيحات',style:Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,),
         Container(
           height:MediaQuery.of(context).size.height*0.1,
         margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.43 ,MediaQuery.of(context).size.width*0.08, MediaQuery.of(context).size.width*0.43 ,0 ),
           decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(25)
           ),
             color:Theme.of(context).primaryColor,
           ),
           child:Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('$numberOfClicks',style:TextStyle(color: AppTheme.white,fontSize: 25),textAlign:TextAlign.center,),
             ],
           ) ,
         )
         ,Container(
           decoration: BoxDecoration( color:Theme.of(context).cardColor,
               borderRadius: BorderRadius.all(Radius.circular(25),
               )
           ),
           margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.33 ,MediaQuery.of(context).size.width*0.04, MediaQuery.of(context).size.width*0.33,0 ),
           child: Text('${Sebha[numberOfList]}',style:Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
         ),
         Container(
           decoration: BoxDecoration( color:Theme.of(context).cardColor,
               borderRadius: BorderRadius.all(Radius.circular(25),
               )
           ),
           margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.25 ,MediaQuery.of(context).size.width*0.04, MediaQuery.of(context).size.width*0.25,0 ),
           child: Text('${numberOfCompletedRound} : تسبيحة كاملة',style:Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
         )
       ],
     ),
    );
  }
}
