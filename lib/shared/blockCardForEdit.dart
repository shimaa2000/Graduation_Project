import 'package:flutter/material.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
class BlockCardForEdit extends StatelessWidget {
  final String text ;
  final double padding;
  final double margin;
  final TextEditingController controller;
  final String validatorTxt;
  final Icon icon;

  BlockCardForEdit({ required this.text,
    this.padding = 0.0,
    this.margin = 0.0,
   required this.controller,
     this.validatorTxt = 'Fill this field',
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
        BoxTextField(
            padding: padding,
            margin: margin,
            controller: controller,
            validatorText: validatorTxt,
            icon:icon,
            onTap: () {}),
        SizedBox(
          height: 20,
        ),
      ]
    );
  }


}
