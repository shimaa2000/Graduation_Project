import 'package:flutter/material.dart';
import 'package:graduation_project/layout/bottomCard.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/radioShortcut.dart';

void bottomForDetails(BuildContext context) {
  showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext contextt) {
        final paymobController = TextEditingController();
        final dateController = TextEditingController();
        return Wrap(children: [
          SingleChildScrollView(
            child: Container(
              height: 550,
              child: Column(
                children: [
                  BottomCard(),
                  Divider(
                    height: 5,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Date',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Payment',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Order For',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Paymob No.',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            BoxTextField(
                                padding: 0,
                                margin: 0,
                                controller: dateController,
                                validatorText: 'please pick date',
                                icon: Icon(Icons.calendar_today),
                                onTap: () {
                                  DatePicker.selectDate(context);
                                }),
                            RadioShortcut(),
                            BoxTextField(
                                padding: 0,
                                margin: 0,
                                controller: paymobController,
                                validatorText: 'please enter paymob no.',
                                icon: Icon(Icons.payment),
                                onTap: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DefaultButton(
                      onPressedFun: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName);
                      },
                      text: 'OK')
                ],
              ),
            ),
          ),
        ]);
      });
}
