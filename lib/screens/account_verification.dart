import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/screens/new_password_screeen.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import '../shared/boxtextfield.dart';

class AccountVerification extends StatefulWidget {
  static const routeName = 'account_verification';

  const AccountVerification({Key? key}) : super(key: key);

  @override
  _AccountVerificationState createState() => _AccountVerificationState();
}

class _AccountVerificationState extends State<AccountVerification> {
  @override
  Widget build(BuildContext context) {
    bool _onEditing = true;
    String _code;
    String emojiUrl = 'images/smile.png';
    String smallText = 'Account';
    String bigText = 'Verification';
    Widget inContainer = Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Code',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            )),
        VerificationCode(
          textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
          keyboardType: TextInputType.number,
          underlineColor: Colors.amber,
          // If this is null it will use primaryColor: Colors.red from Theme
          length: 4,
          cursorColor: Colors.blue,
          // If this is null it will default to the ambient
          // clearAll is NOT required, you can delete it
          // takes any widget, so you can implement your design
          clearAll: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'clear all',
              style: TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                  color: Colors.blue[700]),
            ),
          ),
          onCompleted: (String value) {
            setState(() {
              _code = value;
            });
          },
          onEditing: (bool value) {
            setState(() {
              _onEditing = value;
            });
            if (!_onEditing) FocusScope.of(context).unfocus();
          },
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DefaultButton(
                onPressedFun: () {
                  Navigator.pushNamed(context, NewPassword.routeName);
                },
                text: 'Verify'),
          ),
        ),
      ],
    );
    String fistLineAfterEmoji = 'Enter the verification code we just ';
    String secondLine = 'send you on you email!';

    return SafeArea(
      child: PasswordResetWidget(
          emojiUrl: emojiUrl,
          inContainer: inContainer,
          smallText: smallText,
          bigText: bigText,
          fistLineAfterEmoji: fistLineAfterEmoji,
          secondLine: secondLine),
    );
  }
}
