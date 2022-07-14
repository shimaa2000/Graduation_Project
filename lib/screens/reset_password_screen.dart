import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/screens/account_verification.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import '../shared/boxtextfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = 'reset_password';
  const ResetPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          var layout = LayoutCubit.get(context);
          return PasswordResetWidget(
              emojiUrl: layout.resetEmojiUrl,
              inContainer: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BoxTextField(
                      onTap: () {},
                      controller: layout.resetUserController,
                      validatorText: 'please enter code',
                      icon: Icon(
                        Icons.email,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  DefaultButton(
                      onPressedFun: () {
                        Navigator.pushNamed(
                            context, AccountVerification.routeName);
                      },
                      text: 'Send Code'),
                ],
              ),
              smallText: layout.resetSmallText,
              bigText: layout.resetBigText,
              fistLineAfterEmoji: layout.resetFirstLineAfterEmoji,
              secondLine: layout.resetSecondLine);
        },
        listener: (context, state) {});
  }
}
