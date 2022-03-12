import 'package:flutter/material.dart';
class RadioButtonHorizontal extends StatelessWidget {
  final String value;
  final String groupValue;
  final String text;
  final ValueChanged<dynamic> onChanged;
RadioButtonHorizontal({required this.value, required this.groupValue,
required this.text, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text,style: TextStyle(color: Colors.black,fontSize: 18 ,fontWeight: FontWeight.w300),),
      leading: Radio(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.deepPurple),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}

