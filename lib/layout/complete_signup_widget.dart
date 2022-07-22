import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/text_sized_signUp.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/radioButton.dart';
import 'package:intl/intl.dart';

class CompleteSignUpWidget extends StatefulWidget {
  final formKey;
  final fullNameController;
  final addressController;
  final phoneController;
  TextEditingController dateController;
  final String genderVal;
  final ValueChanged<dynamic> function1;
  final ValueChanged<dynamic> function2;
  final StatelessWidget button;

  CompleteSignUpWidget(
      {Key? key,
      this.formKey,
      this.fullNameController,
      this.addressController,
      this.phoneController,
      required this.dateController,
      required this.genderVal,
      required this.function1,
      required this.function2,
      required this.button})
      : super(key: key);

  @override
  _CompleteSignUpWidgetState createState() => _CompleteSignUpWidgetState();
}

class _CompleteSignUpWidgetState extends State<CompleteSignUpWidget> {
  @override
  Widget build(BuildContext context) {
    Color iLight = Colors.black87;
    Color iDark = Colors.white70;
    return Container(
      alignment: Alignment.center,
      width: 320,
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSizedSignUp(
              sizedHeight: 0,
              text: 'Full Name',
              sizedWidth: 28,
            ),
            BoxTextField(
              controller: widget.fullNameController,
              autofocus: true,
              keyboardType: TextInputType.name,
              icon: Icon(
                Icons.person,
                  color: isDark ? iLight : iDark
              ),
              onTap: () {},
              validatorText: 'please enter full name',
            ),
            TextSizedSignUp(
              sizedHeight: 10,
              text: 'Address',
              sizedWidth: 28,
            ),
            BoxTextField(
              controller: widget.addressController,
              autofocus: true,
              onTap: () {},
              keyboardType: TextInputType.streetAddress,
              icon: Icon(
                Icons.home,
                  color: isDark ? iLight : iDark
              ),
              validatorText: 'please enter address',
            ),
            TextSizedSignUp(
              sizedHeight: 10,
              text: 'Phone Number',
              sizedWidth: 28,
            ),
            BoxTextField(
              controller: widget.phoneController,
              autofocus: true,
              onTap: () {},
              keyboardType: TextInputType.phone,
              icon: Icon(
                Icons.phone,
                  color: isDark ? iLight : iDark
              ),
              validatorText: 'please enter phone number',
            ),
            TextSizedSignUp(
              sizedHeight: 10,
              text: 'Birth Date',
              sizedWidth: 28,
            ),
            BoxTextField(
              controller: widget.dateController,
              autofocus: true,
              keyboardType: TextInputType.datetime,
              onTap: () {
                setState(() {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime(1995, 1),
                          firstDate: DateTime(1995, 1),
                          lastDate: DateTime(2020, 12))
                      .then((value) => widget.dateController.text =
                          DateFormat.yMMMd().format(value!));
                });
              },
              icon: Icon(
                Icons.date_range,
                  color: isDark ? iLight : iDark
              ),
              validatorText: 'please pick date ',
            ),
            TextSizedSignUp(
              sizedHeight: 10,
              text: 'Gender',
              sizedWidth: 30,
            ),
            RadioButtonClass(
              title1: 'Male',
              value1: 'male',
              title2: 'Female',
              value2: 'female',
              groupValue: widget.genderVal,
              onChange1: (value) => widget.function1(value),
              onChange2: (value) => widget.function2(value),
              sizedHeight: 55,
            ),
            SizedBox(
              height: 10,
            ),
            widget.button,
          ],
        ),
      ),
    );
  }
}
