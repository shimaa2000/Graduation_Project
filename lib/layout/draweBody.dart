import 'package:flutter/material.dart';
import 'package:graduation_project/screens/edit_profile.dart';
import 'package:graduation_project/screens/favourite_Rent.dart';
import 'package:graduation_project/screens/get_started.dart';
import 'package:graduation_project/screens/profile.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, EditProfile.routeName);
            },
            child: ListTile(
                leading: Icon(Icons.edit), title: Text('Edit Profile')),
          ),
          Divider(
            thickness: 1.0,
            height: 1.0,
            color: Colors.grey[200],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Favourite_Rent.routeName);
            },
            child: ListTile(
                leading: Icon(Icons.favorite), title: Text('Favourite')),
          ),
          Divider(
            thickness: 1.0,
            height: 1.0,
            color: Colors.grey[200],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Favourite_Rent.routeName);
            },
            child: ListTile(
                leading: Icon(Icons.border_all_sharp), title: Text('Rent')),
          ),
          Divider(
            thickness: 1.0,
            height: 1.0,
            color: Colors.grey[200],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Favourite_Rent.routeName);
            },
            child: ListTile(
                leading: Icon(Icons.ad_units_sharp), title: Text('Ads')),
          ),
          Divider(
            thickness: 1.0,
            height: 1.0,
            color: Colors.grey[200],
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline),
            title: Text('Dark Mode'),
          ),
          Divider(
            thickness: 1.0,
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
    );
  }
}