import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/complete_signup_widget.dart';
import 'package:graduation_project/network/cubit/signUpCubit.dart';
import 'package:graduation_project/network/cubit/signUpStates.dart';
import 'package:graduation_project/screens/sign_up.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/interface_image.dart';

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
      genderVal = 'male';
    });
  }

  var formKey = GlobalKey<FormState>();
  int val = 1;
  String genderVal = 'female';
  String date = '${DateTime.now()}';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignSuccessState) {
          Navigator.pushNamed(context,StartApp.routeName);
          print('success');
        }
        if (state is SignErrorState) {
          Fluttertoast.showToast(
              msg: state.error.errorMessage,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.white,
              textColor: Colors.red,
              fontSize: 16.0);
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
                        genderVal = 'male';
                      });
                    },
                    function2: (val) {
                      setState(() {
                        genderVal = 'female';
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
                                userName: name!,
                                fullName: fullNameController.text,
                                email: email!,
                                password: pass!,
                                gender: genderVal,
                                birthday: dateController.text,
                                phoneNumber: phoneController.text,
                                address: addressController.text,
                              );
                            }
                            print(name! + pass! + email!);
                            print(genderVal +
                                dateController.text +
                                phoneController.text +
                                addressController.text +
                                fullNameController.text);
                          },
                          text: 'Sign up',
                      txtColor: isDark? Colors.white: Colors.black,),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
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
    );
  }
}

