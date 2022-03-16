import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/profile_container.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/user_ads_screen.dart';
import 'package:graduation_project/shared/gird_image.dart';
import 'details_screen.dart';

class Profile extends StatefulWidget {
  static const routeName = 'profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   centerTitle: true,
      // ),
      // drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
             ProfileContainer(),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Top Ads',
                style: TextStyle(
                  color: Colors.black,
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
                  onImageClicked: (i) {
                    Navigator.of(context).pushNamed(
                      DetailsScreen.routeName,
                      arguments: i + 1,
                    );
                    id = i;
                  },
                  onExpandClicked: () {
                    Navigator.pushNamed(context, UserAds.routeName);
                  },
                  maxImages: 4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
