import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/screens/startApp.dart';
import '../screens/get_started.dart';
import 'package:graduation_project/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    String? token = CashHelper.getData(key: 'token');

    if (token != null) {
      widget = StartApp();
    } else {
      widget = GetStarted();
    }
    return AnimatedSplashScreen(
      splash: isDark
          ? Image.asset(
              'images/logo.png',
            )
          : Image.asset('images/logoDark.png'),
      splashIconSize: 270,
      nextScreen: widget,
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Theme.of(context).backgroundColor,
      duration: 2000,
      animationDuration: Duration(seconds: 1),
    );
  }
}
