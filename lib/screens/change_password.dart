import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/network/cubit/resetCubit.dart';
import 'package:graduation_project/network/cubit/resetStates.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController newPassController = TextEditingController();
  TextEditingController currentPassController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final changePassFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color iLight = Colors.black87;
    Color iDark = Colors.white70;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back) , color: isDark? Colors.black54: Colors.white70,onPressed: (){ Navigator.pop(context);},),
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: changePassFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/forget_pass.svg',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .45,
                    ),
                    Text(
                      '''     Wanna change your password?
It's easy ,please fill the following fields.''',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .025,
                          color: isDark? Colors.black87: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    BoxTextField(
                        hint: 'Current password',
                        controller: currentPassController,
                        obsecure: true,
                        validatorText: 'Please enter your new password',
                        icon: Icon(Icons.lock,color: isDark ? iLight : iDark,),
                        onTap: () {}),
                    BoxTextField(
                        hint: 'New password',
                        controller: newPassController,
                        obsecure: true,
                        validatorText: 'Please enter your new password',
                        icon: Icon(Icons.lock,color: isDark ? iLight : iDark,),
                        onTap: () {}),
                    BoxTextField(
                        hint: 'Confirm your password',
                        controller: passController,
                        obsecure: true,
                        validatorText: 'Please enter your new password',
                        icon: Icon(Icons.lock,color: isDark ? iLight : iDark,),
                        onTap: () {}),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    DefaultButton(

                      txtColor: isDark? Colors.white: Colors.black,
                      text: 'Save',
                      onPressedFun: () {
                        if (changePassFormKey.currentState!.validate()) {
                          if (newPassController.text == passController.text) {
                            cubit.changePass(currentPassController.text,newPassController.text);
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
