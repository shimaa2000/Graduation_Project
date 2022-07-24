import 'package:flutter/material.dart';
ThemeData dark = ThemeData(
  unselectedWidgetColor: Colors.white70,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 25,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFB388FF)
    ),
    textTheme: TextTheme(
       // headlineSmall:TextStyle(color: Colors.white70),
headline4: TextStyle(fontSize:22,color: Colors.white70),
      headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      headline1: TextStyle( fontSize: 30, fontWeight: FontWeight.bold , color: Colors.white),
      headline2:  TextStyle( fontSize: 50, fontWeight: FontWeight.bold , color: Colors.black),
      bodyText1: TextStyle(color: Colors.white, fontSize: 16),
      bodyText2: TextStyle(color: Colors.black),
      headline5:TextStyle(color: Colors.white70, fontSize: 16),
      headline6: TextStyle(fontSize: 15, color:  Color(0xFFB388FF)),

    ),
    scaffoldBackgroundColor:  Colors.black87,
    backgroundColor:Colors.black87,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:  Color(0xFFB388FF),
    ),
    primaryColor: Color(0xFFB388FF),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(Color(0xFFB388FF)),
      ),
    )
);
ThemeData light = ThemeData(
    unselectedWidgetColor: Colors.black54,

    iconTheme: IconThemeData(
      color: Colors.white,
      size: 25,
    ),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize:22,color: Colors.black),
      headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),

      headline1: TextStyle( fontSize: 30, fontWeight: FontWeight.bold , color: Colors.black),
      headline2:  TextStyle( fontSize: 50, fontWeight: FontWeight.bold , color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.black, fontSize: 16),
      headline5:TextStyle(color: Colors.black, fontSize: 16),
      headline6: TextStyle(fontSize: 15, color: Colors.deepPurple),
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


//