import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/new_card_widget.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';
class ListViewForDrawer extends StatelessWidget {
  const ListViewForDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
         shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: DUMMY_DATA.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
              Navigator.of(context).pushNamed(
                DetailsScreen.routeName,
              );
            },
            child:
              FittedBox(
                child: NewCardWidget(
                    name: DUMMY_DATA[index].name,
                    date: DUMMY_DATA[index].date,
                    imgUrl: DUMMY_DATA[index].ImgUrl,
                    title: DUMMY_DATA[index].title,
                    price: DUMMY_DATA[index].price as int,
                    size: DUMMY_DATA[index].size, index: index,),),
            );
          }
    );
  }
}
