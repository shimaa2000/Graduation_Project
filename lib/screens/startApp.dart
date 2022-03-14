import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/activity_taps.dart';
import 'package:graduation_project/screens/add_post.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/notifications_screen.dart';
import 'package:graduation_project/screens/profile.dart';
class StartApp extends StatefulWidget {
  static const routeName='start_app';
  const StartApp({Key? key}) : super(key: key);

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  int currentIndex= 0;
 List <Widget> pages =[HomeScreen(), AddPost(), NotificationScreen(), Profile() ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        
        initialActiveIndex: 0,
        backgroundColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.home,),
          TabItem(icon: Icons.add,),
          TabItem(icon: Icons.notifications,),
          TabItem(icon: Icons.person,),
        ],
      ),
    );
  }
}


