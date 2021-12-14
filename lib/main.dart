import 'package:flutter/material.dart';
import 'package:graduation_project/screens/account_verification.dart';
import 'package:graduation_project/screens/add%20post%202.dart';
import 'package:graduation_project/screens/add_post.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/edit_profile.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/screens/new_password_screeen.dart';
import 'package:graduation_project/screens/notifications_screen.dart';
import 'package:graduation_project/screens/profile.dart';
import 'package:graduation_project/screens/reset_password_screen.dart';
import 'package:graduation_project/screens/sign_up.dart';
import 'package:graduation_project/screens/splash_screen.dart';
import 'package:graduation_project/screens/startApp.dart';

import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late User user;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Color.fromRGBO(220, 129, 102, 0.9019607843137255),
          canvasColor: Color.fromRGBO(255, 255, 255, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                bodyText2: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                headline2: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                headline1: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                headline3: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                headline4: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
            headline5: TextStyle(
                color: Colors.black,
                fontSize: 21,
                ),
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            ),
          )),
      routes: {
        '/': (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        AccountVerification.routeName: (context) => AccountVerification(),
        NewPassword.routeName: (context) => NewPassword(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        SignUp.routeName :(context)=>SignUp(),
        Profile.routeName :(context)=>Profile(),
        EditProfile.routeName :(context)=>EditProfile(),
        StartApp.routeName:(context)=>StartApp(),
        NotificationScreen.routeName:(context)=>NotificationScreen(),
        AddPost.routeName:(context)=>AddPost(),
        AddPost2.routeName:(context)=>AddPost2(),
      },
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
