import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  static const String route='/';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/default_bg.png')
      ,fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
      ),
    );
  }
}