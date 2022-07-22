// ignore_for_file: must_be_immutable
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/policies_screen.dart';
import 'package:graduation_project/shared/chechBox.dart';

class CheckBoxSign extends StatefulWidget {
  final StatefulWidget check;
  Color activeColor =Colors.deepPurple;
  Color checkColor=Colors.blue;

   CheckBoxSign({
    Key? key,
    required this.check,
  }) : super(key: key);
  @override
  State<CheckBoxSign> createState() => _CheckBoxSignState();
}

class _CheckBoxSignState extends State<CheckBoxSign> {
  bool agree =false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          widget.check,
          Text.rich(
            TextSpan(
              text: 'accept ',
              style: Theme.of(context).textTheme.bodyText1,
              children: [

                TextSpan(
                    text: ' policies and terms',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent[400],
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PoliciesScreen(),
                          ),
                        );
                      }),
              ],
            ),
          ),
        ],
      ),
    );

  }
}



