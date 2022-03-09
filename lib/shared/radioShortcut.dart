import 'package:flutter/material.dart';
import 'package:graduation_project/shared/radioButton.dart';

class RadioShortcut extends StatefulWidget {
  const RadioShortcut({Key? key}) : super(key: key);

  @override
  _RadioShortcutState createState() => _RadioShortcutState();
}

class _RadioShortcutState extends State<RadioShortcut> {
  @override
  Widget build(BuildContext context) {
    String payment = 'deposite';
    String rentFor = 'buy';
    return Column(
      children: [
        RadioButtonClass(
          title1: 'Deposite',
          title2: 'Full',
          value1: 'deposite',
          value2: 'full',
          groupValue: payment,
          onChange1: (value) {
            setState(() {
              payment = 'deposite';
            });
          },
          onChange2: (value) {
            setState(() {

              payment = 'full';
            });
          }, sizedHeight: 0,
        ),
        SizedBox(
          height: 5,
        ),
        RadioButtonClass(
            title1: 'Rent',
            value1: 'rent',
            title2: 'Buy',
            value2: 'buy',
            groupValue: rentFor,
            onChange1: (value) {
              setState(() {
                rentFor = 'rent';
              });
            },
            onChange2: (value) {
              setState(() {
                rentFor = 'buy';
              });
            }, sizedHeight: 0,)
      ],
    );
  }
}
