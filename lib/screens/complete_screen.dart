import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/layout/complete_signup_widget.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/interface_image.dart';
import 'package:graduation_project/shared/radioButton.dart';
import 'package:intl/intl.dart';
import 'homeScreen.dart';

class CompleteScreen extends StatefulWidget {
  @override
  _CompleteScreenState createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  var fullNameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();

  state1() {
    return setState(() {
      genderVal = 'Male';
    });
  }

  var formKey = GlobalKey<FormState>();
  int val = 1;
  String genderVal = 'Female';
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InterfaceImage(firstLabel: 'About to finish!', secondLabel: 'Complete', forHeight: .35, sizedHeight: 0, sizedWidth: 0,),
              CompleteSignUpWidget(
                genderVal: genderVal,
                function1: (val) {
                  setState(() {
                    genderVal = 'Male';
                  });
                },
                function2: (val) {
                  setState(() {
                    genderVal = 'Female';
                  });
                },
                phoneController: phoneController,
                addressController: addressController,
                dateController: dateController,
                formKey: formKey,
                fullNameController: fullNameController,
                button: DefaultButton(
                    onPressedFun: () {
                      if (formKey.currentState!.validate()) {
                        Dialogs.yesAbortDialog(
                            context,
                            Text(
                              'You have an account now!',
                              textAlign: TextAlign.center,
                            ),
                            'Cancel',
                            'Ok', () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        }, () {
                          Navigator.of(context).pop(DialogAction.cancle);
                        }, 'images/check.svg', 200, 200);
                      }
                    },
                    text: 'Sign up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
