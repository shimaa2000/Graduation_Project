import 'package:flutter/material.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import '../shared/boxtextfield.dart';

class NewPassword extends StatelessWidget {
  bool isTapped = false;
  static const routeName = 'new_password';
   NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller1 = TextEditingController();
    final _controller2 = TextEditingController();
    String emojiUrl = '';
    String smallText = 'Reset';
    String bigText = 'Password';
    String fistLineAfterEmoji = 'You can have a new password';
    String secondLine = 'for your account now!';
    Widget inContainer = Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:  BoxTextField(
            onTap: (){},
            obsecure: true,
            controller: _controller1,
            validatorText: 'please enter password',
            icon: Icon(
              Icons.lock,
              color: Colors.black54,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: BoxTextField(
            onTap: (){},
            obsecure: true,
            controller: _controller2,
            validatorText: 'please confirm password',
            icon: Icon(
              Icons.lock,
              color: Colors.black54,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DefaultButton(
            onPressedFun: () => Dialogs.yesAbortDialog(context, Text('You can login to your account now!'), 'Cancel', 'Login', () { Navigator.pushNamed(context, LoginScreen.routeName);},(){Navigator.of(context).pop(DialogAction.cancle);
            }, 'images/check.svg', 200 , 200),
            text: 'Save'),
      ],
    );


    return PasswordResetWidget(
        emojiUrl: emojiUrl,
        inContainer: inContainer,
        smallText: smallText,
        bigText: bigText,
        fistLineAfterEmoji: fistLineAfterEmoji,
        secondLine: secondLine);
  }
}
