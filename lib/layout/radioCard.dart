import 'package:flutter/material.dart';
import 'package:graduation_project/shared/radioButtonHorizontal.dart';
class RadioCard extends StatefulWidget {
  const RadioCard({Key? key}) : super(key: key);

  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  @override
  Widget build(BuildContext context) {
    String groupValueAddress = 'current';
    String groupValueContact = '01009525463';
    String groupValuePay = 'cash';
    String valueAdd1 = 'current';
    String valueAdd2 = 'new';
    String valueCon1 = '01009525463';
    String valueCon2 = 'newC';
    String valuePay1 = 'cash';
    String valuePay2 = 'online';


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25,),
        Text('Delivery Address',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w300),),
        SizedBox(height: 10,),
        RadioButtonHorizontal(value: valueAdd1, groupValue: groupValueAddress, text: 'Your Current Address', onChanged: (value){
          setState(() {
            groupValueAddress = valuePay1;
          });
        }),
        RadioButtonHorizontal(value: valueAdd2, groupValue: groupValueAddress, text: 'Choose New Address', onChanged: (value){
          setState(() {
            groupValueAddress = valueAdd2;
          });
        }),


        SizedBox(height: 20,),
        Text('Contact Number',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w300),),
        SizedBox(height: 10,),
        RadioButtonHorizontal(value: valueCon1, groupValue: groupValueContact, text: '01009525463', onChanged: (value){
          setState(() {
            groupValueAddress = valueCon1;
          });
        }),
        RadioButtonHorizontal(value: valueCon2, groupValue: groupValueContact, text: 'Choose New Contact Number', onChanged: (value){
          setState(() {
            groupValueAddress = valueCon2;
          });
        }),


        SizedBox(height: 20,),
        Text('Payment Option',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w300),),
        SizedBox(height: 10,),
        RadioButtonHorizontal(value: valuePay1, groupValue: groupValuePay, text: 'Cash On Delivery', onChanged: (value){
          setState(() {
            groupValuePay = valuePay1;
          });
        }),
        RadioButtonHorizontal(value: valuePay2, groupValue: groupValuePay, text: 'Credit', onChanged: (value){
          setState(() {
            groupValuePay = valuePay2;
          });
        }),
        SizedBox(height: 25,),


      ],
    );
  }
}
