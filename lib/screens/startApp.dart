import 'package:flutter/material.dart';
import 'package:graduation_project/screens/activity_taps.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/profile.dart';
class StartApp extends StatefulWidget {
  static const routeName='start_app';
  const StartApp({Key? key}) : super(key: key);

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  int currentIndex= 0;
 List <Widget> pages =[HomeScreen(), Profile(),ActivityTaps(), ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Activites',
          ),

        ],
      ),
    );
  }
}


