import 'package:flutter/material.dart';
import 'package:graduation_project/layout/category_shape_widget.dart';
import 'package:graduation_project/shared/listViewForTopAds.dart';

int id = 0;

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Top Ads',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: [ListViewForTopAds()],
                ),

            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Available Items',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 10.0,
            ),
          CategoryShape(text1: 'Male', text2: 'Female',),
          ],
        ),


    );
  }
}
