import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/screens/homeScreen.dart';
class Prices extends StatelessWidget {
double price = DUMMY_DATA[id].price;
double delivery = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: TextStyle(fontSize: 16, color: Colors.black54),),
            Text('EGP ${price}',style: TextStyle(fontSize: 16, color: Colors.black54),),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee', style: TextStyle(fontSize: 16, color: Colors.black54),),
            Text('EGP ${delivery}',style: TextStyle(fontSize: 16, color: Colors.black54),),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: TextStyle(fontSize: 22, color: Colors.deepPurple, fontWeight: FontWeight.w500),),
            Text('EGP ${total()}',style: TextStyle(fontSize: 22, color: Colors.deepPurple , fontWeight: FontWeight.w500),),
          ],
        ),
      ],
    );
  }

  double total(){
    double total = price + delivery;
    return total;
  }
}
