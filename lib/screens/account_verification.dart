import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/screens/new_password_screeen.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import '../shared/boxtextfield.dart';

class AccountVerification extends StatelessWidget {
  static const routeName = 'account_verification';

  const AccountVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController();
    final controller2 = TextEditingController();
    final controller3 = TextEditingController();
    final controller4 = TextEditingController();

    String emojiUrl = 'images/smile.png';
    String smallText = 'Account';
    String bigText = 'Verification';
    Widget inContainer = Column(
      children: [
        Container(alignment:Alignment.topLeft,padding: EdgeInsets.all(10),child: Text('Code',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w300),)),
        Row(
          children: [
            Container(
              width: 70,
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: controller1,
                decoration: InputDecoration(
                  hintText: '0',
                    hintStyle: TextStyle(
                        fontSize: 25
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  counterStyle:TextStyle(
                    fontSize: 20
                  )
                ),
              ),
            ),
            Container(
              width: 70,
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: controller2,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 25
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  hintText: '0',
                ),
              ),
            ),
            Container(
              width: 70,
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: controller3,
                decoration: InputDecoration(
                  hintText: '0',
                    hintStyle: TextStyle(
                      fontSize: 25
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                ),
              ),
            ),
            Container(
              width: 70,
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: controller4,
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(
                      fontSize: 25
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 70,
        ),
        DefaultButton(onPressedFun: () {
          Navigator.pushNamed(context, NewPassword.routeName);
        }, text: 'Verify'),
      ],
    );
    String fistLineAfterEmoji = 'Enter the verification code we just ';
    String secondLine = 'send you on you email!';

    return PasswordResetWidget(
        emojiUrl: emojiUrl,
        inContainer: inContainer,
        smallText: smallText,
        bigText: bigText,
        fistLineAfterEmoji: fistLineAfterEmoji,
        secondLine: secondLine);
  }
}
