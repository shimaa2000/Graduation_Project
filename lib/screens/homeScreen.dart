import 'package:flutter/material.dart';
import 'package:graduation_project/layout/search_classDelegate.dart';
import 'package:graduation_project/screens/edit_profile.dart';
import 'package:graduation_project/screens/get_started.dart';
import 'package:graduation_project/screens/profile.dart';
import 'package:graduation_project/shared/listView.dart';
import 'package:graduation_project/shared/listViewForTopAds.dart';
import 'add_post.dart';

int id = 0;

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  final List<String> list = List.generate(10, (id) => "Text $id");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Column(
              children: [ListViewBuilderData()],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Profile.routeName);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('Hello, User Name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('UserMail@gmail.com'),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, EditProfile.routeName);
                  },
                  child: Text('Edit Profile')),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[200],
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline),
              title: Text('Dark Mode'),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[200],
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetStarted()));
                },
                child: ListTile(
                  leading: Icon(Icons.subdirectory_arrow_left_outlined),
                  title: Text('SignOut'),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pushNamed(context, AddPost.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}