import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddPostRow(
                      descController: descController,
                      titleController: titleController,
                      colorController: colorController,
                      sizeController: sizeController,
                      typeController: typeController,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    DefaultButton(
                      txtColor: isDark? Colors.white: Colors.black,
                        onPressedFun: () {
                          print(titleController.text + descController.text + sizeController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPost2(
                                    title: titleController.text,
                                    description: descController.text,
                                    sizeName: sizeController.text)),
                          );
                        },
                        text: 'Next'),
                  ],
                ),
              ),
            )));
  }
}
