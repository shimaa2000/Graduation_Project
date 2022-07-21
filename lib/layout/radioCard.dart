import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/shared/radioButtonHorizontal.dart';
class RadioCard extends StatefulWidget {
  const RadioCard({Key? key}) : super(key: key);

  @override
  _RadioCardState createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  @override
  Widget build(BuildContext context) {



    return BlocConsumer<LayoutCubit, LayoutStates>(builder: (context, state){
      var layout = LayoutCubit.get(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          Text('Delivery Address',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w300),),
          SizedBox(height:25,),
          Row(children: [
            SizedBox(width: 25.0,),

            Icon(Icons.edit_location_outlined),
            SizedBox(width: 25.0,),
            Text('address', style: TextStyle(color: Colors.black),)
          ],),


          SizedBox(height: 20,),
          Text('Contact Number',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w300),),
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 25.0,),

            Icon(Icons.phone_android),
            SizedBox(width: 25.0,),
            Text('01002597986', style: TextStyle(color: Colors.black),)
          ],),


          SizedBox(height: 20,),
          Text('Payment Option',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w300),),
          SizedBox(height: 10,),
          RadioButtonHorizontal(value: layout.cashValuePay1, groupValue: layout.groupValuePay, text: 'Cash On Delivery', onChanged: (value){
            setState(() {
              layout.groupValuePay = layout.cashValuePay1;
            });
          }),
          RadioButtonHorizontal(value: layout.onlineValuePay2, groupValue: layout.groupValuePay, text: 'Credit', onChanged: (value){
            setState(() {
              layout.groupValuePay = layout.onlineValuePay2;
            });
          }),
          SizedBox(height: 25,),


        ],
      );
    }, listener: (context, state){});
  }
}
