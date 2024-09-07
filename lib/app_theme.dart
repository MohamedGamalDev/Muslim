import 'dart:ui';
import 'package:flutter/material.dart';
class AppTheme
{
  static const Color lightPrimary= Color(0xFFB7935F);
  static const Color darkPrimary= Color(0xFF141A2E);
  static const Color white= Color(0xFFF8F8F8);
  static const Color black= Color(0xFF242424);
  static const Color gold= Color(0xFFFACC1D);
 ///////
  static ThemeData lightTheme=ThemeData(
    primaryColor:lightPrimary ,
    appBarTheme: AppBarTheme(
     iconTheme: IconThemeData(color:AppTheme.black ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
        titleTextStyle:TextStyle(
        fontWeight: FontWeight.bold,
          color: AppTheme.black,
          fontSize: 30,
      )
    ),
    scaffoldBackgroundColor: Colors.transparent

      ,bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: lightPrimary,
    selectedItemColor: AppTheme.black,
    unselectedItemColor: AppTheme.white,
  ),
    textTheme: TextTheme(
        headlineSmall: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: AppTheme.black)
       , bodyLarge: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: AppTheme.white)
    ,titleLarge: TextStyle(fontWeight:FontWeight.w500,fontSize: 20,color: AppTheme.black )
    ),
canvasColor:AppTheme.white,
      cardColor:AppTheme.lightPrimary,
  );
  /////
  static ThemeData darkTheme=ThemeData(
    primaryColor:darkPrimary ,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color:AppTheme.gold ),

        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle:TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.white,
          fontSize: 30,
        )
    ),
    scaffoldBackgroundColor: Colors.transparent

    ,bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: darkPrimary,
    selectedItemColor: AppTheme.gold,
    unselectedItemColor: AppTheme.white,
  ),
    textTheme: TextTheme(
        headlineSmall: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: AppTheme.white)
        , bodyLarge: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: AppTheme.black)
        ,titleLarge: TextStyle(fontWeight:FontWeight.w500,fontSize: 25,color: AppTheme.gold )
    ),
    canvasColor:AppTheme.darkPrimary,
 cardColor: AppTheme.gold
  );


}