import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/layout/complete_signup_widget.dart';
import 'package:graduation_project/network/cubit/signUpCubit.dart';
import 'package:graduation_project/network/cubit/signUpStates.dart';
import 'package:graduation_project/screens/sign_up.dart';
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
  String date = '${DateTime.now()}';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignSuccessState) {
            if (state.userResponse.status == true) {
              print(state.userResponse.user);
              Navigator.pushNamed(context, HomeScreen.routeName);
              print('success');
            } else {
              print(state.userResponse.error?.errorMail);
              print(state.userResponse.error?.errorPass);
              Fluttertoast.showToast(
                  msg:
                      "Failed To register",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.white,
                  textColor: Colors.red,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InterfaceImage(
                      firstLabel: 'About to finish!',
                      secondLabel: 'Complete',
                      forHeight: .35,
                      sizedHeight: 0,
                      sizedWidth: 0,
                    ),
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
                      button: ConditionalBuilderRec(
                        condition: state is! SignLoadingState,
                        builder: (context) => DefaultButton(
                            onPressedFun: () {
                              if (formKey.currentState!.validate()) {
                                SignUpCubit.get(context).userSign(
                                    userName: name,
                                  fullName : fullNameController.text,
                                    email: email,
                                    password: pass,
                                    gender: genderVal,
                                    birthday: dateController.text,
                                    phoneNumber: phoneController.text,
                                    address: addressController.text,
                                );
                              }
                              print(name+pass+email);
                              print(genderVal + dateController.text + phoneController.text +addressController.text+ fullNameController.text);
                            },
                            text: 'Sign up'),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//
// Dialogs.yesAbortDialog(
// context,
// Text(
// 'You have an account now!',
// textAlign: TextAlign.center,
// ),
// 'Cancel',
// 'Ok', () {
// Navigator.pushNamed(context, HomeScreen.routeName);
// }, () {
// Navigator.of(context).pop(DialogAction.cancle);
// }, 'images/check.svg', 200, 200);
