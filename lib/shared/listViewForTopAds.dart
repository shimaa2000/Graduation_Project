import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/topAdCard.dart';

class ListViewForTopAds extends StatelessWidget {
  const ListViewForTopAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: DUMMY_DATA.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TopAdCard(
            title: DUMMY_DATA[index].title,
            price: DUMMY_DATA[index].price,
            imgUrl: DUMMY_DATA[index].ImgUrl,
          );
        },
      ),
    );
  }
}
