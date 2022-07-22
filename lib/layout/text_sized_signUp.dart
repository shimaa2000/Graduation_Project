import 'package:flutter/material.dart';
class TextSizedSignUp extends StatelessWidget {
  final double sizedHeight;
  final double sizedWidth;
  final String text;
  const TextSizedSignUp({Key? key, required this.sizedHeight, required this.text, required this.sizedWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: sizedHeight,),
        Row(children: [
          SizedBox(width: sizedWidth,),
          Text(text,style: Theme.of(context).textTheme.bodyText1,),
        ],),
      ],
    );
  }
}
