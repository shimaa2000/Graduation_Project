// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/layout/checkBoxSign.dart';
import 'package:graduation_project/layout/signup_widget.dart';
import 'package:graduation_project/screens/complete_screen.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/interface_image.dart';

class SignUp extends StatefulWidget {
  static const routeName = 'sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InterfaceImage(
                firstLabel: 'hello!',
                secondLabel: 'Sign up',
                forHeight: .38,
                sizedHeight: 15,
                sizedWidth: 20,
              ),
              SignUpWidget(
                formKey: formKey,
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPassController: confirmPassController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: CheckBoxSign(
                  check: Checkbox(
                    activeColor: Colors.deepPurple,
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value ?? false;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              DefaultButton(
                enable: agree,
                text: 'Next',
                onPressedFun: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompleteScreen(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 5.0,),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 25.0),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have account ? ',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Login.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                              }),
                      ],
                    ),
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
