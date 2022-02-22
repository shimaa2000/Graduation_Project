import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/reset_password_screen.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/background.png',
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                  child: Text(
                    'Welcome back!',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            BoxTextField(
              onTap: (){},
              controller: userController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              hint: '',
              icon: Icon(
                Icons.person,
                color: Colors.black54,
              ),
              label: 'Username',
            ),
            BoxTextField(
              onTap: (){},
              obsecure: true,
              controller: passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              hint: '',
              icon: Icon(
                Icons.lock,
                color: Colors.black54,
              ),
              label: 'Password',
            ),
            Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).primaryColor),
                  ),),),
                DefaultButton(onPressedFun: (){Navigator.pushNamed(context, StartApp.routeName);}, text: 'Login'),
          ],
        ),),);}}
