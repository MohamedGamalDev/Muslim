import 'dart:ui';
import 'package:flutter/material.dart';
class AppTheme
{
  static const Color lightPrimary= Color(0xFFB7935F);
  static const Color darkPrimary= Color(0xFF141A2E);
  static const Color white= Color(0xFFF8F8F8);
  static const Color black= Color(0xFF242424);
  static const Color gold= Color(0xFFFACC1D);
  static ThemeData lightTheme=ThemeData(
    primaryColor:lightPrimary ,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle:TextStyle(
        fontWeight: FontWeight.bold,
          color: black,
          fontSize: 30,
      )
    ),
    scaffoldBackgroundColor: Colors.transparent
      ,bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: lightPrimary,
    selectedItemColor: black,
    unselectedItemColor: white,
  ),
    textTheme: TextTheme(
        headlineSmall: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: black)
    ,titleLarge: TextStyle(fontWeight:FontWeight.w500,fontSize: 20,color: black )
    )
  );
  static ThemeData darkTheme=ThemeData();


}