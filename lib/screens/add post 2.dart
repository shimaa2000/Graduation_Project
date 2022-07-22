import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/add_post_cubit.dart';
import 'package:graduation_project/network/cubit/add_post_states.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/radioButton.dart';
import 'package:intl/intl.dart';

import '../shared/alertForNewPost.dart';

class AddPost2 extends StatefulWidget {
  static const routeName = 'add_post2';
  final String title;
  final String description;
  final String sizeName;

  const AddPost2({Key? key, required this.title, required this.description, required this.sizeName}) : super(key: key);

  @override
  _AddPost2State createState() => _AddPost2State();
}

class _AddPost2State extends State<AddPost2> {
  final forHeight = TextEditingController();
  final forWeight = TextEditingController();
  final dateController = TextEditingController();
  final priceController = TextEditingController();
  String genderType = 'male';
  String postType = 'rent';
  String donationV = 'yes';
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => PostProductCubit(),
        child: BlocConsumer<PostProductCubit, PostProductStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit=PostProductCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 8),
                      child: Text(
                        'Complete Your Product data',
                        style: Theme.of(context).textTheme.headline5,
                      ),
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
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * .3, 50),
                            primary: Colors.white,
                            elevation: 1.0),
                        onPressed: () {
                           PostAlerts.photoDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Upload',
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text("Height",
                        style: Theme.of(context).textTheme.headline5),
                    BoxTextField(
                        controller: forHeight,
                        validatorText: 'please enter height',
                        icon: Icon(
                          Icons.height,
                        ),
                        onTap: () {}),
                    Text("Weight",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 15.0,
                    ),
                    BoxTextField(
                        controller: forWeight,
                        validatorText: 'please choose weight',
                        icon: Icon(
                          Icons.monitor_weight,
                        ),
                        onTap: () {}),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text("Available form",
                        style: Theme.of(context).textTheme.headline5),
                    BoxTextField(
                      controller: dateController,
                      autofocus: true,
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime(1995, 1),
                            firstDate: DateTime(1995, 1),
                            lastDate: DateTime(2020, 12))
                            .then((value) => dateController.text =
                            DateFormat.yMMMd().format(value!));
                      },
                      icon: Icon(
                        Icons.date_range,
                      ),
                      validatorText: 'please enter date',
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text("Price", style: Theme.of(context).textTheme.headline5),
                    BoxTextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        validatorText: 'please enter price',
                        icon: Icon(
                          Icons.attach_money,
                        ),
                        onTap: () {}),
                    SizedBox(
                      height: 15.0,
                    ),
                    RadioButtonClass(
                      title1: 'male',
                      title2: 'female',
                      value1: 'male',
                      value2: 'female',
                      groupValue: genderType,
                      onChange1: (value) {
                        setState(() {
                          genderType = 'male';
                        });
                      },
                      onChange2: (value) {
                        setState(() {
                          genderType = 'female';
                        });
                      },
                      sizedHeight: MediaQuery.of(context).size.width * .3,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    RadioButtonClass(
                      title1: 'Rent',
                      title2: 'Sale',
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
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: DefaultButton(
                          onPressedFun: () {
                            print(widget.title +widget.sizeName +widget.description +img!.path + priceController.text);
                            cubit.addPost(image: img, name: widget.sizeName,title: widget.title,description:widget.description ,price: int.parse(priceController.text));
                            Navigator.pushReplacement(context,  MaterialPageRoute(
                                builder: (context) =>StartApp()));
                          },
                          text: 'Next'),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
