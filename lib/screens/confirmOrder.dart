import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/radioCard.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/paybalScreen.dart';
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
      appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back_sharp ,color: isDark? Colors.white: Colors.black,) ,onPressed: (){ Navigator.pop(context);},), systemOverlayStyle: SystemUiOverlayStyle(),backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0,),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Confirm Order',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: isDark? Colors.black: Colors.white,
                      fontSize: 25),
                )),
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Container(
                decoration: BoxDecoration(
                    color: isDark? Colors.deepPurple.shade400.withAlpha(20): Colors.grey.shade800,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                width: double.infinity,
                height: 300,
                //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Prices(),

                      DefaultButton(
                          txtColor:isDark? Colors.white: Colors.black,
                          onPressedFun: (){
                        Navigator.pushNamed(context, PaybalScreen.routeName);
                      }, text: 'Confirm'),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
