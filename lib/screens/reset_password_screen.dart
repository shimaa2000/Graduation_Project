import 'package:flutter/material.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/screens/account_verification.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import '../shared/boxtextfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = 'reset_password';
  const ResetPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    BoxTextField boxTextField = BoxTextField(
      onTap: (){},
      controller: userController,
      validatorText: 'please enter code',
      icon: Icon(
        Icons.email,
        color: Colors.black54,
      ),
    );
    String emojiUrl = 'images/sad.png';
    String smallText = 'Forget';
    String bigText = 'Password?';
    Widget inContainer = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: boxTextField,
        ),
        SizedBox(
          height: 60,
        ),
        DefaultButton(onPressedFun: (){Navigator.pushNamed(context, AccountVerification.routeName);}, text: 'Send Code'),
      ],
    );
    String fistLineAfterEmoji = 'Enter your email associated with this account ';
    String secondLine = 'for password recovery!';

    return PasswordResetWidget(
        emojiUrl: emojiUrl,
        inContainer: inContainer,
        smallText: smallText,
        bigText: bigText,
        fistLineAfterEmoji: fistLineAfterEmoji,
        secondLine: secondLine);
  }
}
