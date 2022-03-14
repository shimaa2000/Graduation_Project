import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';

import '../layout/new_card_widget.dart';

class ListViewBuilderData extends StatelessWidget {
  final String categories;

  ListViewBuilderData({Key? key, this.categories = 'all'}) : super(key: key);
  Widget listFit(int index){
    return FittedBox(
        child: NewCardWidget(
        name: DUMMY_DATA[index].name,
        date: DUMMY_DATA[index].date,
        imgUrl: DUMMY_DATA[index].ImgUrl,
        title: DUMMY_DATA[index].title,
        price: DUMMY_DATA[index].price,
        size: DUMMY_DATA[index].size));
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: DUMMY_DATA.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailsScreen.routeName,
                arguments: DUMMY_DATA[index].id,
              );
              id = DUMMY_DATA[index].id - 1;
            },
            child: categories == 'all'
                ?listFit(index)
                : DUMMY_DATA[index].gender == categories
                    ? listFit(index)
                    : SizedBox(width: 500,height: .5,),
          );
        });
  }
}
