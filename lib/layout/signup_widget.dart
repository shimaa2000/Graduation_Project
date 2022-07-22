import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/text_sized_signUp.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/screens/policies_screen.dart';
import 'package:graduation_project/shared/boxtextfield.dart';

class SignUpWidget extends StatelessWidget {
  final formKey;
  final nameController;
  final emailController;
  final passwordController;
  final confirmPassController;

  const SignUpWidget({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPassController,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Color iLight = Colors.black87;
    Color iDark = Colors.white70;
    return Container(
      alignment: Alignment.center,
      width: 320,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSizedSignUp(sizedHeight: 0, text: 'Username', sizedWidth: 28,),
            BoxTextField(
              controller: nameController,
              autofocus: true,
              keyboardType: TextInputType.name,
              onTap: () {},
              icon: Icon(
                Icons.person,
                  color: isDark ? iLight : iDark
              ),
              validatorText: 'please enter name',
            ),
            TextSizedSignUp(sizedHeight: 0, text: 'Email', sizedWidth: 28,),
            BoxTextField(
              controller: emailController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              onTap: () {},
              icon: Icon(
                Icons.email,
                  color: isDark ? iLight : iDark
              ),
              validatorText: 'please enter mail',
            ),
            TextSizedSignUp(sizedHeight: 0, text: 'Password', sizedWidth: 28,),
            BoxTextField(
              controller: passwordController,
              autofocus: true,
              keyboardType: TextInputType.visiblePassword,
              onTap: () {},
              obsecure: true,
              icon: Icon(
                Icons.lock,
                  color: isDark ? iLight : iDark
              ),
              validatorText: 'please enter password',
            ),
            TextSizedSignUp(sizedHeight: 0, text: 'Confirm Password ', sizedWidth: 28,),
            BoxTextField(
              controller: confirmPassController,
              autofocus: true,
              keyboardType: TextInputType.name,
              onTap: () {},
              obsecure: true,
              icon: Icon(
                Icons.lock,
                  color: isDark ? iLight : iDark
              ),
              validatorText: 'please confirm password',
            ),
            SizedBox(
              height: 5.0,
            ),

          ],
        ),
      ),
    );
  }
}
