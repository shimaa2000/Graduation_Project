import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/endPoints.dart';
import '../core/services/local/casheHelper.dart';
import '../layout/text_sized_signUp.dart';
import '../network/cubit/loginCubit.dart';
import '../network/cubit/loginStates.dart';
import '../screens/reset_password_screen.dart';
import '../screens/startApp.dart';
import '../shared/boxtextfield.dart';
import '../shared/defaultButton.dart';
import '../shared/interface_image.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Color iLight = Colors.black87;
    Color iDark = Colors.white70;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            // print(state.loginResponse.userId);
            CashHelper.saveData(key: 'id', value: state.loginResponse.userId);
            CashHelper.saveData(key: 'token', value: state.loginResponse.token)
                .then((value) {
              Navigator.pushNamed(context, StartApp.routeName);
            });
          }

          if (state is LoginErrorState) {
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
          final loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: loginCubit.loginFormKey,
                  child: Column(
                    children: [
                      InterfaceImage(
                        firstLabel: 'Welcome back!',
                        secondLabel: 'Login',
                        forHeight: .47,
                        sizedHeight: 30,
                        sizedWidth: 20,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextSizedSignUp(
                        sizedHeight: 0,
                        text: 'Email',
                        sizedWidth: 28,
                      ),
                      BoxTextField(
                        onTap: () {},
                        controller: loginCubit.emailController,
                        validatorText: 'please enter valid mail',
                        icon: Icon(
                          Icons.mail,
                          color: isDark ? iLight : iDark,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextSizedSignUp(
                        sizedHeight: 0,
                        text: 'Password',
                        sizedWidth: 28,
                      ),
                      BoxTextField(
                        onTap: () {},
                        obsecure: true,
                        controller: loginCubit.passController,
                        validatorText: 'password is too short',
                        icon: Icon(
                          Icons.lock,
                          color: isDark ? iLight : iDark,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ResetPasswordScreen.routeName);
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      ConditionalBuilderRec(
                        condition: state is! LoginLoadingState,
                        builder: (context) => DefaultButton(
                          txtColor: isDark? Colors.white: Colors.black  ,
                          onPressedFun: () {
                            if (LoginCubit.get(context)
                                .loginFormKey
                                .currentState!
                                .validate()) {
                              LoginCubit.get(context).userLogin();
                            }
                          },
                          text: 'Login',
                        ),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
