import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/reset_password_screen.dart';
import '../screens/startApp.dart';
import '../shared/boxtextfield.dart';
import '../shared/defaultButton.dart';
import '../shared/interface_image.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final passController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InterfaceImage(firstLabel: 'Welcome back!', secondLabel: 'Login', forHeight: .47, sizedHeight: 20, sizedWidth: 20,),
              SizedBox(
                height: 15,
              ),
              BoxTextField(
                onTap: (){},
                controller: userController,
                validatorText: 'please enter name',
                icon: Icon(
                  Icons.person,
                  color: Colors.black54,
                ),
              ),
              BoxTextField(
                onTap: (){},
                obsecure: true,
                controller: passController,
                validatorText: 'please enter password',
                icon: Icon(
                  Icons.lock,
                  color: Colors.black54,
                ),
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
          ),),
      ),);}}
