import 'package:flutter/material.dart';
import 'package:graduation_project/layout/radioCard.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/prices.dart';
class ConfirmOrder extends StatefulWidget {
  static const routeName='confirm_order';
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Confirm Order'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Prices(),
            RadioCard(),
            DefaultButton(onPressedFun: (){
              Navigator.pushNamed(context, DetailsScreen.routeName);
            }, text: 'Confirm'),

          ],
        ),
      ),
    );
  }
}
