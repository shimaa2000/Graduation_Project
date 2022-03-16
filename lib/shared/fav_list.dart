import 'package:flutter/material.dart';
import 'package:graduation_project/layout/new_card_widget.dart';

import '../dummy_data.dart';
class FavList extends StatelessWidget {
  const FavList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fav_list.isEmpty
    ? const Center(
    child: Text(
    'There are no favorites yet!',
    style: TextStyle(color: Colors.black),
    ),
    )
        :ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
    itemCount: fav_list.length,
    scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) { return FittedBox(
        child:NewCardWidget(
          isFav: true,
          name: fav_list[index].name,
          date: fav_list[index].date,
          imgUrl: fav_list[index].ImgUrl,
          title: fav_list[index].title,
          price: fav_list[index].price,
          size: fav_list[index].size, index: index,)); },);
  }
}
