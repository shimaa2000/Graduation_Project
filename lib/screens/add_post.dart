import 'package:flutter/material.dart';
import 'package:graduation_project/screens/add%20post%202.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/imagePicker.dart';
import 'package:image_picker/image_picker.dart';

import 'image_screen.dart';


class AddPost extends StatefulWidget {
  static const routeName = 'add_post';

  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

enum ImageSourceType { gallery, camera }

class _AddPostState extends State<AddPost> {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final colorController = TextEditingController();
  String dropdownValue = 'One';
  String dropdownsize = 'L';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
                  child: Text(
                    'Enter Your Product data',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),


                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          SizedBox(height: 18),
                          Text('Upload photo',
                              style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 35,),
                          Text('Take a photo',
                              style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 32,),
                          Text('Title',
                              style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 27,),
                          Text('Description',
                              style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 27,),
                          Text('Color',
                              style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 27,),
                          Text('Size',
                              style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 27,),
                          Text('Type',
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: MaterialButton(
                              color: Colors.deepPurple,
                              child: Text(
                                "From Gallery",
                                style: TextStyle(
                                    color: Colors.white70, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => Images().uploadImageFromGallery()
                            ),
                          ),
                          MaterialButton(
                            color: Colors.deepPurple,
                            child: Text(
                              "From Camera",
                              style: TextStyle(
                                  color: Colors.white70, fontWeight: FontWeight.bold),
                            ),
                            onPressed: ()=> Images().uploadImageFromCamera()
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 50,
                            child: BoxTextField(
                                controller: titleController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please confirm your Title';
                                  }
                                  return null;
                                },
                                hint: '',
                                icon: Icon(Icons.title),
                                label: '',
                                onTap: () {}),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 50,
                            child: BoxTextField(
                                controller: descriptionController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please confirm your description';
                                  }
                                  return null;
                                },
                                hint: '',
                                icon: Icon(Icons.description_outlined ,color: Colors.black54,),
                                label: '',
                                onTap: () {}),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 50,
                            child: BoxTextField(
                                controller: colorController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please confirm your color';
                                  }
                                  return null;
                                },
                                hint: '',
                                icon: Icon(Icons.color_lens_outlined),
                                label: '',
                                onTap: () {}),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 50,
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal  : 28.0),
                              child: DropdownButton<String>(
                                value: dropdownsize,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.black26,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownsize = newValue!;
                                  });
                                },
                                items: <String>['S', 'L', 'XL', 'XXL']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: SizedBox(width:140,child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Text(value),
                                    )),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 50,
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal  : 28.0),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down_sharp,),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black,),
                                underline: Container(
                                  height: 2,
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  color: Colors.black26,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>['One', 'Two', 'Free', 'Four']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child:  SizedBox(width:140,child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Text(value),
                                    )),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: DefaultButton(onPressedFun: (){
                      Navigator.pushNamed(context, AddPost2.routeName);
                  }, text: 'Next'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void pichImage() async{
  var image = await ImagePicker().pickImage(source: ImageSource.camera);
}