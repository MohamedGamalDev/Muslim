import 'package:flutter/material.dart';
import 'Home page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      routes:
      {
        HomePage.route:(context) => HomePage()
      },
    );
  }
}
