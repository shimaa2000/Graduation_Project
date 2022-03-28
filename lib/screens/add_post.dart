import 'package:flutter/material.dart';
import 'package:graduation_project/screens/add%20post%202.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/shared/addPostContent1.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/alertForNewPost.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/dropDown.dart';
import 'package:graduation_project/shared/imagePicker.dart';

class AddPost extends StatefulWidget {
  static const routeName = 'add_post';
  const AddPost({Key? key}) : super(key: key);
  @override
  _AddPostState createState() => _AddPostState();
}

enum ImageSourceType { gallery, camera }

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 50.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(   crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      height: 15.0,
                    ),

                        Text(
                          'Upload Photos',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                    SizedBox(
                      height: 15.0,
                    ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                                primary: Colors.white,elevation: 1.0),
                            onPressed: () {
                              Alerts.photoDialog(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.upload_rounded,color: Colors.black54,),
                                SizedBox(width: 100.0,),
                                Text('Upload',style: TextStyle(color: Colors.black54),)
                              ],
                            )),
                    SizedBox(
                      height: 15.0,
                    ),
                    AddPostRow(),
                    SizedBox(
                      height: 40.0,
                    ),
                    DefaultButton(
                        onPressedFun: () {
                          Navigator.pushNamed(context, AddPost2.routeName);
                        },
                        text: 'Next'),
                  ],
                ),
              ),
            )));
  }
}
