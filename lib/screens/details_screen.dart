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
    // final dressId = ModalRoute.of(context)!.settings.arguments ;
    // final selectedDress = DUMMY_DATA.firstWhere((dress) => dress.id == dressId);
    return DetailsWidget(
        type: DUMMY_DATA[index].type,
        size: DUMMY_DATA[index].size,
        title: DUMMY_DATA[index].title,
        price: DUMMY_DATA[index].price.toString(),
        gender: DUMMY_DATA[index].gender,
        date: DUMMY_DATA[index].date,
        description: DUMMY_DATA[index].description,
        height: DUMMY_DATA[index].height,
        width: DUMMY_DATA[index].width,
        imageUrl: DUMMY_DATA[index].ImgUrl);
  }
}
