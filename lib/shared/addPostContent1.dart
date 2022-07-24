import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
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
    Color iLight = Colors.black87;
    Color iDark = Colors.white70;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.0,),
          Text(
            'Item Title',
            style: Theme.of(context).textTheme.headline3,
          ),
          TextField(controller: titleController,style: TextStyle(fontSize: 20), decoration: InputDecoration(

            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:isDark? iLight: iDark),
            ),
          ),),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Description',
            style:  Theme.of(context).textTheme.headline3,
          ),
          TextField(style: TextStyle(fontSize: 22),controller:descController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Color',
            style:  Theme.of(context).textTheme.headline3,
          ),
          TextField(style: TextStyle(fontSize: 22),controller:colorController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Size',
            style:  Theme.of(context).textTheme.headline3,
          ),
          TextField(style: TextStyle(fontSize: 22),controller:sizeController),
          SizedBox(
            height: 20.0,
          ),Text(
            'Item Type',
            style:  Theme.of(context).textTheme.headline3,
          ),
          TextField(style: TextStyle(fontSize: 22),controller:typeController),

        ],
      );
  }
}
