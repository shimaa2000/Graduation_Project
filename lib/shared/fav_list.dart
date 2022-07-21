import 'package:flutter/material.dart';
import 'package:graduation_project/layout/new_card_widget.dart';

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
          imgUrl: 'https://media.istockphoto.com/vectors/dress-icon-vector-id507081676?k=20&m=507081676&s=612x612&w=0&h=k1p9VA6YqPIwMEyj290EMrI1EtHIz4EK8yLf9YV7_DM=',
          title: fav_list[index].title,
          price: fav_list[index].price,
          size: fav_list[index].size, index: index,)); },);
  }
}
