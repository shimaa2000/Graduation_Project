import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';

class AddPostRow extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descController;
  final  TextEditingController colorController;
  final TextEditingController sizeController;
  final TextEditingController typeController;
  AddPostRow({ required this.titleController, required this.descController, required this.colorController, required this.sizeController, required this.typeController});

  @override
  Widget build(BuildContext context) {

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Item Title',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(controller: titleController,style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Description',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:descController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Color',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:colorController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Size',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:sizeController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Item Type',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          TextField(style: TextStyle(fontSize: 22),controller:typeController),

        ],
      );
  }
}
