import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
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
                            DatePicker.selectDate(context)
                            .then(
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
                            activeColor: Colors.deepPurple,
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
                            activeColor: Colors.deepPurple,
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
                              Dialogs.yesAbortDialog(context, Text('You have an account now!',textAlign: TextAlign.center,), 'Cancel', 'Ok', () {Navigator.pushNamed(context, HomeScreen.routeName); },(){Navigator.of(context).pop(DialogAction.cancle);}, 'images/check.svg', 200, 200);
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
