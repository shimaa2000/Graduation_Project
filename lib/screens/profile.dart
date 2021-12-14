import 'package:flutter/material.dart';
import 'package:graduation_project/screens/followers_screen.dart';
import 'package:graduation_project/screens/following_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import '../shared/defaultButton.dart';

class Profile extends StatefulWidget {
  static const routeName='profile';
  // List <Widget>screens=[
  //   HomeScreen(),
  //   Profile(),
  // ];

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,

        // title: Text('test'),
        centerTitle: true,
      ),
    //   bottomNavigationBar: BottomNavigationBar(
    //   fixedColor: Colors.deepPurple,
    //   type: BottomNavigationBarType.fixed,
    //
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: 'Home',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person),
    //       label: 'Profile',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.local_activity),
    //       label: 'Activites',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.mail),
    //       label: 'Messages',
    //     ),
    //   ],
    // ),
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
        child: Center(
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
                              CircleAvatar(
                                radius: 70.0,
                                backgroundColor: Colors.grey,
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
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FollowersScreen()));
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
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FollowingScreen()));
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  DefaultButton(onPressedFun: (){}, text: 'message'),
                                  DefaultButton(onPressedFun: (){}, text: 'follow'),
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
              SizedBox(height: 20.0,),
              Text('Top Ads', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26.0,),),
              SizedBox(height: 20.0,),
              Container(
                // padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0)),
                          width: 120.0,
                          height: 160.0,
                          child: Image.asset(
                            'images/download.jpg',
                            height: 120.0,
                            width: 160.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0)),
                          width: 120.0,
                          height: 160.0,
                          child: Image.asset(
                            'images/photo.jpg',
                            height: 120.0,
                            width: 160.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0)),
                          width: 120.0,
                          height: 160.0,
                          child: Image.asset(
                            'images/download.jpg',
                            height: 120.0,
                            width: 160.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0)),
                          width: 120.0,
                          height: 160.0,
                          child: Image.asset(
                            'images/photo.jpg',
                            height: 120.0,
                            width: 160.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
