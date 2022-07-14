import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/detials_widget.dart';
import 'homeScreen.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = 'details_screen';
  const DetailsScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DetailsWidget(

        type: DUMMY_DATA[id].type,
        size: DUMMY_DATA[id].size,
        title: DUMMY_DATA[id].title,
        price: DUMMY_DATA[id].price.toString(),
        gender: DUMMY_DATA[id].gender,
        date: DUMMY_DATA[id].date,
        description: DUMMY_DATA[id].description,
        height: DUMMY_DATA[id].height,
        width: DUMMY_DATA[id].width,
        imageUrl: DUMMY_DATA[id].ImgUrl);
  }
}
