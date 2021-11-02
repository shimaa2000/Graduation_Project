import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/get_started.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'images/logo.png',
      ),
      splashIconSize: 270,
      nextScreen: GetStarted(),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.white,
      duration: 2000,
      animationDuration: Duration(seconds: 1 ) ,
    );
  }
}
