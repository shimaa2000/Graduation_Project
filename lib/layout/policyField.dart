import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
class PoliciesText extends StatelessWidget {
  final String hint;
  const PoliciesText({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 2,
      maxLines: 30,
      readOnly: true,
      enabled: false,
      autofocus: false,
      //  keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: isDark?Colors.black:Colors.white70, fontSize: 20  ),
        border: InputBorder.none,
      ),
    );
  }
}
