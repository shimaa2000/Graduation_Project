import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/card_widget.dart';

class ListViewBuilderData extends StatelessWidget {
  const ListViewBuilderData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: DUMMY_DATA.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                  child: CardWidget(
                      name: DUMMY_DATA[index].name,
                      date: DUMMY_DATA[index].date,
                      imgUrl: DUMMY_DATA[index].ImgUrl,
                      title: DUMMY_DATA[index].title,
                      price: DUMMY_DATA[index].price,
                      size: DUMMY_DATA[index].size)),
              Expanded(
                  child: CardWidget(
                      name: DUMMY_DATA[index].name,
                      date: DUMMY_DATA[index].date,
                      imgUrl: DUMMY_DATA[index].ImgUrl,
                      title: DUMMY_DATA[index].title,
                      price: DUMMY_DATA[index].price,
                      size: DUMMY_DATA[index].size)),
            ],
          );
        });
  }
}
