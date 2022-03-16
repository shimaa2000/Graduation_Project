import 'package:flutter/material.dart';
import 'package:graduation_project/shared/fav_list.dart';
import 'package:graduation_project/shared/listView.dart';

class Favourite_Rent extends StatelessWidget {
  const Favourite_Rent({Key? key}) : super(key: key);
  static const routeName = 'list_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: [
            FavList(),
          ],
        ),
      )
    ));
  }
}
