import 'package:flutter/material.dart';

class AddPostRow extends StatelessWidget {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final  TextEditingController colorController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

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
