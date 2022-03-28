// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class checkBoxClass extends StatelessWidget {
  final bool value ;
  final ValueChanged<bool> onChanged;
        Color activeColor =Colors.deepPurple;
        Color checkColor=Colors.blue;
  checkBoxClass({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return checkBoxClass( value : value, onChanged: onChanged,);
  }
}

