import 'package:flutter/material.dart';
import 'package:graduation_project/shared/radioButton.dart';

class RadioForSheet extends StatefulWidget {
  const RadioForSheet({Key? key}) : super(key: key);

  @override
  _RadioForSheetState createState() => _RadioForSheetState();
}

class _RadioForSheetState extends State<RadioForSheet> {
  @override
  Widget build(BuildContext context) {
    String typeFor = 'Rent';
    return RadioButtonClass(
        title1: 'Rent',
        value1: 'Rent',
        title2: 'Sell',
        value2: 'Sell',
        groupValue: typeFor,
        onChange1: (value){setState(() {
          typeFor = 'Rent';
        });},
        onChange2: (value){setState(() {
          typeFor = 'Sell';
        });}, sizedHeight: 0,);
  }
}
