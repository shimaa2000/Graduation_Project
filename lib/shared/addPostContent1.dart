import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';

class AddPostRow extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(builder: (context, state){
      var layout = LayoutCubit.get(context);
      return Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Item Title',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(controller: layout.titleController,style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Description',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:layout.descController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Color',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:layout.colorController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Size',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:layout.sizeController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Item Type',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:layout.typeController),

        ],
      );
    }, listener: (context, state){});
  }
}
