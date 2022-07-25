import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/radioButton.dart';

class EditPost extends StatefulWidget {
  static const routeName = 'HomeScreen';
  const EditPost({Key? key}) : super(key: key);
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {

  final postfor = TextEditingController();
  String postType = 'rent';
  Color iLight = Colors.black87;
  Color iDark = Colors.white70;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>AppCubit(), child: BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var app = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Edit Your Data',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        BoxTextField(
                          padding: 0,
                          margin: 0,
                          controller: app.Title,
                          onTap: () {},
                          icon: Icon(
                            Icons.title,
                            color: isDark ? iLight : iDark,
                          ),
                          validatorText: 'fill this field',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        BoxTextField(
                            padding: 0,
                            margin: 0,
                            controller: app.Description,
                            onTap: () {},
                            icon: Icon(
                              Icons.description,
                              color: isDark ? iLight : iDark,
                            ),
                            validatorText: 'fill this field'),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Price',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        BoxTextField(
                            padding: 0,
                            margin: 0,
                            controller: app.Price,
                            onTap: () {},
                            icon: Icon(
                              Icons.price_change,
                              color: isDark ? iLight : iDark,
                            ),
                            validatorText: 'fill this field'),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Post For',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(height: 10.0,),
                        RadioButtonClass(
                          title1: 'rent',
                          title2: 'sale',
                          value1: 'rent',
                          value2: 'sale',
                          groupValue: postType,
                          onChange1: (value) {
                            setState(() {
                              postType = 'rent';
                            });
                          },
                          onChange2: (value) {
                            setState(() {
                              postType = 'sale';
                            });
                          },
                          sizedHeight: MediaQuery.of(context).size.width * .3,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        DefaultButton(
                            txtColor: isDark ? Colors.white : Colors.black,
                            onPressedFun: () {
                              app.editPostFun(id!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            text: 'Save'),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    ),);
  }
}
