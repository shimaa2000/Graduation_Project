import 'package:flutter/material.dart';
import 'package:graduation_project/layout/text_sized_signUp.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/radioButton.dart';
import 'package:intl/intl.dart';

class CompleteSignUpWidget extends StatelessWidget {
  final formKey;
  final fullNameController;
  final addressController;
  final phoneController;
  final dateController;
  final String genderVal;
  final ValueChanged<dynamic> function1;
  final ValueChanged<dynamic> function2;
  final StatelessWidget button;
  const CompleteSignUpWidget({Key? key, this.formKey, this.fullNameController, this.addressController, this.phoneController, this.dateController, required this.genderVal, required this.function1, required this.function2, required this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 320,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSizedSignUp(sizedHeight: 0, text: 'Full Name', sizedWidth: 28,),
            BoxTextField(
              controller: fullNameController,
              autofocus: true,
              keyboardType: TextInputType.name,
              icon: Icon(
                Icons.person,
              ),
              onTap: () {},
              validatorText: 'please enter full name',
            ),
            TextSizedSignUp(sizedHeight: 10, text: 'Address', sizedWidth: 28,),
            BoxTextField(
              controller: addressController,
              autofocus: true,
              onTap: () {},
              keyboardType: TextInputType.streetAddress,
              icon: Icon(
                Icons.home,
              ),
              validatorText: 'please enter address',
            ),
            TextSizedSignUp(sizedHeight: 10, text: 'Phone Number', sizedWidth: 28,),
            BoxTextField(
              controller: phoneController,
              autofocus: true,
              onTap: () {},
              keyboardType: TextInputType.phone,
              icon: Icon(
                Icons.phone,
              ),
              validatorText: 'please enter phone number',
            ),
            TextSizedSignUp(sizedHeight: 10, text: 'Birth Date', sizedWidth: 28,),
            BoxTextField(
              controller: dateController,
              autofocus: true,
              keyboardType: TextInputType.datetime,
              onTap: () {
                DatePicker.selectDate(context).then(
                      (value) => dateController.text =
                      DateFormat.yMMMd().format(value!),
                );
              },
              icon: Icon(
                Icons.date_range,
              ),
              validatorText: 'please pick date ',
            ),
            TextSizedSignUp(sizedHeight: 10, text: 'Gender', sizedWidth: 30,),
            RadioButtonClass(
                title1: 'Male',
                value1: 'Male',
                title2: 'Female',
                value2: 'Female',
                groupValue: genderVal,
                onChange1: (value) => function1(value),
                onChange2: (value)=>function2(value), sizedHeight: 55,),
            SizedBox(
              height: 10,
            ),
            button,
          ],
        ),
      ),
    );
  }
}