import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/card_widget.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/shared/listView.dart';

class ActivityTaps extends StatefulWidget {
  const ActivityTaps({Key? key}) : super(key: key);

  @override
  _ActivityTapsState createState() => _ActivityTapsState();
}

class _ActivityTapsState extends State<ActivityTaps> {
  int selectedTab = 0;
  bool isSelected = true;
  static const List<Tab> myTabs = [
    Tab(
      child: Text(
        'Ads',
        style: TextStyle(fontSize: 18.0),
      ),
    ),
    Tab(
      child: Text('Rent', style: TextStyle(fontSize: 18.0)),
    ),
    Tab(
      child: Text('Favourite', style: TextStyle(fontSize: 18.0)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.deepPurple),
            elevation: 0.0,
            backgroundColor: Colors.white,
            bottom: TabBar(
              enableFeedback: true,
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: myTabs,
              indicatorColor: Colors.deepPurple,
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              ListViewBuilderData(),
              ListViewBuilderData(),
              ListViewBuilderData(),
            ],
          ),
        ));
  }
}
