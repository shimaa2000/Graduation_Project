import 'package:flutter/material.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController controller;

  final FormFieldValidator<String> validator;
  final bool obsecure;
  final String hint;
  final bool readOnly;
  final TextInputType keyboardType;

  // final ValueChanged<String> onChanged;
  final bool isMulti;
  final bool autofocus;
  final Icon icon;
  final bool enabled;
  final Function onTap;

  // final String errorText;
  final String label;
  final double padding;
  final double margin;

  const BoxTextField({
    Key? key,
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obsecure = false,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.enabled = true,
    // required this.onChanged,
    required this.hint,
    required this.icon,
    required this.label,
    required this.onTap,
    this.padding = 30.0, this.margin=10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        // onChanged: onChanged,
        autofocus: autofocus,
        onTap: onTap as Function(),
        minLines: isMulti ? 4 : 1,
        maxLines: isMulti ? null : 1,
        enabled: enabled,
        readOnly: readOnly,
        obscureText: obsecure,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          // prefix:  icon,
          prefixIcon: icon,
          hintText: hint,
          labelStyle: TextStyle(fontSize: 15),
          // labelText: label,
          hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        ),
        style: TextStyle(fontSize: 18.0, height: 2.0, color: Colors.black),
        // validator: validator,
      ),
    );
  }
}
