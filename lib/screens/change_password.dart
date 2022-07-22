import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/network/cubit/resetCubit.dart';
import 'package:graduation_project/network/cubit/resetStates.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController newPassController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final changePassFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => ResetCubit(),
        child:
            BlocConsumer<ResetCubit, ResetStates>(listener: (context, state) {
          if (state is ResetErrorState) {
            Fluttertoast.showToast(
                msg: state.error.errorMessage,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.white,
                textColor: Colors.red,
                fontSize: 16.0);
          }
        }, builder: (context, state) {
          var cubit = ResetCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: changePassFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/forget_pass.svg',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .5,
                    ),
                    Text(
                      '''     Wanna change your password?
It's easy ,please fill the following fields.''',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .025,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    BoxTextField(
                        hint: 'New password',
                        controller: newPassController,
                        obsecure: true,
                        validatorText: 'Please enter your new password',
                        icon: Icon(Icons.lock),
                        onTap: () {}),
                    BoxTextField(
                        hint: 'Re-Enter your password',
                        controller: passController,
                        obsecure: true,
                        validatorText: 'Please enter your new password',
                        icon: Icon(Icons.lock),
                        onTap: () {}),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    DefaultButton(
                      text: 'Save',
                      onPressedFun: () {
                        if (changePassFormKey.currentState!.validate()) {
                          if (newPassController.text == passController.text) {
                            cubit.setNewPass(newPassController.text);
                            Fluttertoast.showToast(
                                msg: 'Your password changed successfully.',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 5,
                                backgroundColor: Colors.white,
                                textColor: Colors.green,
                                fontSize: 16.0);
                            Navigator.pushNamed(context, StartApp.routeName);
                          } else
                            Fluttertoast.showToast(
                                msg: 'Please enter identical password.',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 5,
                                backgroundColor: Colors.white,
                                textColor: Colors.red,
                                fontSize: 16.0);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
