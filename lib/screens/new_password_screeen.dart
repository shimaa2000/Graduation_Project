import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/network/cubit/resetCubit.dart';
import 'package:graduation_project/network/cubit/resetStates.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class NewPassword extends StatelessWidget {
  static const routeName = 'new_password';
  NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetStates>(
        builder: (context, state) {
          var reset = ResetCubit.get(context);
          return PasswordResetWidget(
              emojiUrl: reset.passEmojiUrl,
              inContainer: Form(
                key: reset.newPassFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: BoxTextField(
                        onTap: () {},
                        obsecure: true,
                        controller: reset.passController,
                        validatorText: 'please enter password',
                        icon: Icon(
                          Icons.lock,
                          color:isDark? Colors.black: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: BoxTextField(
                        onTap: () {},
                        obsecure: true,
                        controller: reset.passConfirmController,
                        validatorText: 'please confirm password',
                        icon: Icon(
                          Icons.lock,
                          color:isDark? Colors.black: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ConditionalBuilderRec(
                      condition: state is! NewPassLoadingState,
                      builder: (context) => DefaultButton(
                        txtColor: isDark? Colors.white: Colors.black,
                          onPressedFun: () {
                            if (reset
                                .newPassFormKey
                                .currentState!
                                .validate()) {
                             reset.setNewPass(reset.passController.text);
                              Dialogs.yesAbortDialog(
                                  context,
                                  Text('You can login to your account now!'),
                                  'Cancel',
                                  'Login', () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              }, () {
                                Navigator.of(context).pop(DialogAction.cancle);
                              }, 'images/check.svg', 200, 200);
                            }
                          },
                          text: 'Save'),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              smallText: reset.passSmallText,
              bigText: reset.passBigText,
              fistLineAfterEmoji: reset.passFistLineAfterEmoji,
              secondLine: reset.passSecondLine);
        },
        listener: (context, state) {});
  }
}
