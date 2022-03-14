import 'package:flutter/material.dart';
import 'package:graduation_project/layout/category_shape_widget.dart';
import 'package:graduation_project/layout/draweBody.dart';
import 'package:graduation_project/layout/search_classDelegate.dart';
import 'package:graduation_project/shared/listView.dart';
import 'package:graduation_project/shared/listViewForTopAds.dart';
import 'package:slide_drawer/slide_drawer.dart';

int id = 0;

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  final List<String> list = List.generate(10, (id) => "Text $id");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon:(Icon(Icons.menu,)),
        // onPressed: ()=>  SliderDrawer(),),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(list));
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
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
      ),
      drawer: Drawer(
        child: DrawerBody(),
      ),
    );
  }
}
