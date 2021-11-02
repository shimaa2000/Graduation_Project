import 'package:flutter/material.dart';
import 'package:graduation_project/shared/boxtextfield.dart';

class PasswordResetWidget extends StatelessWidget {

  final String emojiUrl;
  final String smallText;
  final String bigText;
  final Widget inContainer;
  final String fistLineAfterEmoji;
  final String secondLine;

  const PasswordResetWidget(
      {Key? key,

      required this.emojiUrl,
      required this.inContainer,
      required this.smallText,
      required this.bigText, required this.fistLineAfterEmoji, required this.secondLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 75),
                  child: Text(
                    smallText,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                  child: Text(
                    bigText,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            emojiUrl!=''?Image.asset(
              emojiUrl,
              width: 150,
              height: 150,
            ) : SizedBox(),
            SizedBox(

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  fistLineAfterEmoji,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  secondLine,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Container(
              height: 255,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              
              decoration:
                  BoxDecoration(border: Border.all(width: 2.5,color: Colors.deepPurple),borderRadius: BorderRadius.circular(20)),
              child: inContainer,
            ),
          ],
        ),
      ),
    );
  }
}
