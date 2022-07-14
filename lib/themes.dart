import 'package:flutter/material.dart';
ThemeData dark = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFBA68C8)
  ),
    textTheme: TextTheme(
      headline1: TextStyle( fontSize: 30, fontWeight: FontWeight.bold , color: Colors.white),
      bodyText2: TextStyle(color: Colors.black),
    ),
scaffoldBackgroundColor:  Colors.grey[400],
    backgroundColor: Colors.grey[400],
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:  Color(0xFFBA68C8),
    ),
    primaryColor: Color(0xFFBA68C8),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(Color(0xFFBA68C8)),
      ),
    )
);
ThemeData light = ThemeData(
  textTheme: TextTheme(
    headline1: TextStyle( fontSize: 30, fontWeight: FontWeight.bold , color: Colors.black),
    headline2:  TextStyle( fontSize: 50, fontWeight: FontWeight.bold , color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple
    ),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    primaryColor: Colors.deepPurple,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:  Colors.deepPurple
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(Colors.deepPurple),
      ),
    )
);
