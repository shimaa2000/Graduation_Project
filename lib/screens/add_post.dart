import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/add%20post%202.dart';
import 'package:graduation_project/shared/addPostContent1.dart';
import 'package:graduation_project/shared/defaultButton.dart';

import '../shared/alertForNewPost.dart';

class AddPost extends StatefulWidget {
  static const routeName = 'add_post';
   AddPost({Key? key}) : super(key: key);
  @override
  _AddPostState createState() => _AddPostState();
}

enum ImageSourceType { gallery, camera }

class _AddPostState extends State<AddPost> {
  File? f;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
