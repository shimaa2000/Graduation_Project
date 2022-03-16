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
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final colorController = TextEditingController();
  String dropdownType = 'Body-con';
  String dropdownSize = 'L';
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
//
// Column(
// children: [
// Padding(
// padding:
// const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
// child: Text(
// 'Enter Your Product data',
// style: Theme.of(context).textTheme.headline5,
// ),
// ),
// SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.all(3.0),
// child: Row(
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// textBaseline: TextBaseline.alphabetic,
// children: [
// SizedBox(height: 18),
// Text('Upload photo',
// style: Theme.of(context).textTheme.headline5),
// SizedBox(
// height: 35,
// ),
// Text('Take a photo',
// style: Theme.of(context).textTheme.headline5),
// SizedBox(
// height: 32,
// ),
// Text('Title',
// style: Theme.of(context).textTheme.headline5),
// SizedBox(
// height: 27,
// ),
// Text('Description',
// style: Theme.of(context).textTheme.headline5),
// SizedBox(
// height: 27,
// ),
// Text('Color',
// style: Theme.of(context).textTheme.headline5),
// SizedBox(
// height: 27,
// ),
// Text('Size',
// style: Theme.of(context).textTheme.headline5),
// SizedBox(
// height: 27,
// ),
// Text('Type',
// style: Theme.of(context).textTheme.headline5),
// ],
// ),
// SizedBox(
// width: 5,
// ),
// Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 10.0),
// child: MaterialButton(
// color: Colors.deepPurple,
// child: Text(
// "From Gallery",
// style: TextStyle(
// color: Colors.white70,
// fontWeight: FontWeight.bold),
// ),
// onPressed: () =>
// Images().uploadImageFromGallery()),
// ),
// MaterialButton(
// color: Colors.deepPurple,
// child: Text(
// "From Camera",
// style: TextStyle(
// color: Colors.white70,
// fontWeight: FontWeight.bold),
// ),
// onPressed: () =>
// Images().uploadImageFromCamera()),
// Container(
// width: MediaQuery.of(context).size.width / 1.8,
// height: 50,
// child: BoxTextField(
// controller: titleController,
// validatorText: 'please enter title',
// icon: Icon(Icons.title),
// onTap: () {}),
// ),
// Container(
// width: MediaQuery.of(context).size.width / 1.8,
// height: 50,
// child: BoxTextField(
// controller: descriptionController,
// validatorText: 'please enter description',
// icon: Icon(
// Icons.description_outlined,
// color: Colors.black54,
// ),
// onTap: () {}),
// ),
// Container(
// width: MediaQuery.of(context).size.width / 1.8,
// height: 50,
// child: BoxTextField(
// controller: colorController,
// validatorText: 'please pick color',
// icon: Icon(Icons.color_lens_outlined),
// onTap: () {}),
// ),
// Container(
// width: MediaQuery.of(context).size.width / 1.8,
// height: 50,
// child: Padding(
// padding:
// const EdgeInsets.symmetric(horizontal: 28.0),
// child: DropDown(
// value: dropdownSize,
// itemsList: ['S', 'M', 'L', 'XL', 'XXL'],
// ),
// ),
// ),
// Container(
// width: MediaQuery.of(context).size.width / 1.8,
// height: 50,
// child: Padding(
// padding:
// const EdgeInsets.symmetric(horizontal: 28.0),
// child: DropDown(
// value: dropdownType,
// itemsList: ['Body-con', 'A-line', 'Paesant'],
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 15.0),
// child:
// )
// ],
// ),
