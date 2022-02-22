import 'package:flutter/material.dart';

class DatePicker {
   static selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.utc(2023, 12, 31));
  }
}
