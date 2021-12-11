import 'package:flutter/material.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';

import 'image_screen.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

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

  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: MaterialButton(
                  color: Colors.deepPurple,
                  child: Text(
                    "Pick Image from Gallery",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    _handleURLButtonPress(context, ImageSourceType.gallery);
                  },
                ),
              ),
              MaterialButton(
                color: Colors.deepPurple,
                child: Text(
                  "Pick Image from Camera",
                  style: TextStyle(
                      color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.camera);
                },
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
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: BoxTextField(
                              controller: userController,
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
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: BoxTextField(
                              controller: userController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please confirm your decription';
                                }
                                return null;
                              },
                              hint: '',
                              icon: Icon(Icons.description_outlined ,color: Colors.black54,),
                              label: '',
                              onTap: () {}),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: BoxTextField(
                              controller: userController,
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
                        ),Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: BoxTextField(
                              controller: userController,
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
                        ),Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 50,
                          child: BoxTextField(
                              controller: userController,
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
                      ],
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: DefaultButton(onPressedFun: (){}, text: 'Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
