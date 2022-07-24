import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/shared/boxtextfield.dart';

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
        BoxTextField(padding:0,margin:0,controller: titleController, onTap: (){}, icon: Icon(Icons.title, color: isDark ? iLight : iDark,), validatorText: '',
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Description',
          style:  Theme.of(context).textTheme.headline3,
        ),
        BoxTextField(padding:0,margin:0,controller: descController, onTap: (){}, icon: Icon(Icons.description , color: isDark ? iLight : iDark,), validatorText: ''),
        SizedBox(
          height: 20.0,
        ),Text(
          'Color',
          style:  Theme.of(context).textTheme.headline3,
        ),
        BoxTextField(padding:0,margin:0,controller: colorController, onTap: (){}, icon: Icon(Icons.color_lens, color: isDark ? iLight : iDark,), validatorText: ''),
        SizedBox(
          height: 20.0,
        ),Text(
          'Size',
          style:  Theme.of(context).textTheme.headline3,
        ),
        BoxTextField(padding:0,margin:0,controller: sizeController, onTap: (){}, icon: Icon(Icons.photo_size_select_large, color: isDark ? iLight : iDark,), validatorText: ''),
        SizedBox(
          height: 20.0,
        ),Text(
          'Item Type',
          style:  Theme.of(context).textTheme.headline3,
        ),
        BoxTextField(padding:0,margin:0,controller: typeController, onTap: (){}, icon: Icon(Icons.style, color: isDark ? iLight : iDark,), validatorText: ''),

      ],
    );
  }
}
