import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/screens/followers_screen.dart';
import 'package:graduation_project/screens/following_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/grid_image.dart';
import 'package:graduation_project/shared/imagePicker.dart';
import '../shared/defaultButton.dart';

class Profile extends StatefulWidget {
  static const routeName = 'profile';
  // List <Widget>screens=[
  //   HomeScreen(),
  //   Profile(),
  // ];

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      drawer: Drawer(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250.0,
                  color: Colors.deepPurple,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      width: 320.0,
                      height: 440.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.9),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Colors.grey.shade500,
                          width: 3.0,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => Dialogs.yesAbortDialog(context,
                                  Text('Choose', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, ),textAlign: TextAlign.center,), 'Camera', 'Gallery', () {
                                Images().uploadImageFromGallery();
                              }, () {
                                Images().uploadImageFromCamera();
                              }, 'images/logo.png', 200, 200),
                              child: CircleAvatar(
                                radius: 70.0,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'UserName',
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Menofia, Egypt',
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade400),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FollowersScreen()));
                                      },
                                      child: Text(
                                        'Followers',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      '150',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FollowingScreen()));
                                      },
                                      child: Text(
                                        'Following',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      '300',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                DefaultButton(
                                    onPressedFun: () {}, text: 'message'),
                                DefaultButton(
                                    onPressedFun: () {}, text: 'follow'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Top Ads',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 270,
              height: 250,
              child: PhotoGrid(
                imageUrls: DUMMY_MY_POSTS,
                onImageClicked: (i) => print('Image $i was clicked!'),
                onExpandClicked: () => print('Expand Image was clicked'),
                maxImages: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
