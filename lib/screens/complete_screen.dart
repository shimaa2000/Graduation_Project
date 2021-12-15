import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:intl/intl.dart';

import 'homeScreen.dart';
import 'login_screen.dart';

class CompleteScreen extends StatefulWidget {
  @override
  _CompleteScreenState createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  var fullNameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int val = 1;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'images/background.png',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 23, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About to finish!',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Complete',
                          style: TextStyle(
                            fontSize: 54,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: 320,
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoxTextField(
                          controller: fullNameController,
                          autofocus: true,
                          label: "Full Name",
                          keyboardType: TextInputType.name,
                          hint: '',
                          icon: Icon(
                            Icons.person,
                          ),
                          onTap: () {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please confirm your name';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      BoxTextField(
                          controller: addressController,
                          autofocus: true,
                          label: "Address",
                          onTap: () {},
                          keyboardType: TextInputType.streetAddress,
                          hint: '',
                          icon: Icon(
                            Icons.home,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please confirm your address';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      BoxTextField(
                          controller: phoneController,
                          autofocus: true,
                          onTap: () {},
                          label: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          hint: '',
                          icon: Icon(
                            Icons.phone,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your phone';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      BoxTextField(
                          controller: dateController,
                          autofocus: true,
                          label: "Birth Year",
                          keyboardType: TextInputType.datetime,
                          hint: ' ',
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.utc(2021, 12, 31),
                            ).then(
                              (value) => dateController.text =
                                  DateFormat.yMMMd().format(value!),
                            );
                          },
                          icon: Icon(
                            Icons.date_range,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your date';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Gender'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 1,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = 1;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Male",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Radio(
                            value: 2,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = 2;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Female",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DefaultButton(
                          onPressedFun: () {
                            if (formKey.currentState!.validate()) {
                              print(fullNameController.text);
                              print(addressController.text);
                              print(phoneController.text);
                              print(dateController.text);
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  title: Container(
                                    width: 150,
                                    height: 150,
                                    child: SvgPicture.asset('images/check.svg',
                                        fit: BoxFit.contain),
                                  ),
                                  content: Container(
                                    width: double.infinity,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'You can have an account now.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Center(
                                      child: DefaultButton(
                                        onPressedFun: () {
                                          Navigator.pushNamed(
                                              context, StartApp.routeName);
                                        },
                                        text: 'Login',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          text: 'Sign up'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
