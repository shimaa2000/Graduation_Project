import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/network/cubit/resetCubit.dart';
import 'package:graduation_project/network/cubit/resetStates.dart';
import 'package:graduation_project/screens/account_verification.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import '../shared/boxtextfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = 'reset_password';
  const ResetPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetStates>(
        builder: (context, state) {
          var reset = ResetCubit.get(context);
          return PasswordResetWidget(
              emojiUrl: reset.resetEmojiUrl,
              inContainer: Form(
                key: reset.resetFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: BoxTextField(
                        onTap: () {},
                        controller: reset.resetUserController,
                        validatorText: 'please enter mail',
                        icon: Icon(
                          Icons.email,
                          color: isDark? Colors.black:Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ConditionalBuilderRec(

                      condition: state is! ResetLoadingState,
                      builder: (context) => DefaultButton(
                        txtColor: isDark? Colors.white: Colors.black,
                        onPressedFun: () {
                          if (reset
                              .resetFormKey
                              .currentState!
                              .validate()) {
                           reset.resetPass();
                            Navigator.pushNamed(
                                context, AccountVerification.routeName);
                          }
                        },
                        text: 'Send Code',
                      ),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              smallText: reset.resetSmallText,
              bigText: reset.resetBigText,
              fistLineAfterEmoji: reset.resetFirstLineAfterEmoji,
              secondLine: reset.resetSecondLine);
        },
        listener: (context, state) {});
  }
}
