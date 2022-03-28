import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 30.0,
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
            title: Text('Edit Profile'),
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
          ListTile(
            leading: Icon(Icons.subdirectory_arrow_left_outlined),
            title: Text('SignOut'),
          ),
        ],
      ),
    );
  }
}
