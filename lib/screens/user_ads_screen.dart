import 'package:flutter/material.dart';
import 'package:graduation_project/layout/topAdCard.dart';

import '../dummy_data.dart';
import 'details_screen.dart';
import 'homeScreen.dart';

class UserAds extends StatelessWidget {
  static const routeName='user_ads';
  const UserAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Column(children: [
                ...DUMMY_DATA
                    .map(
                      (data) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        DetailsScreen.routeName,
                        arguments: data.id,
                      );
                      id = data.id - 1;
                    },
                    child: Column(
                      children: [
                       TopAdCard(imgUrl: data.ImgUrl, title:  data.title, price:  data.price)
                      ],
                    ),
                  ),
                )
                    .toList(),

              ],),
              Column(children: [
                ...DUMMY_DATA
                    .map(
                      (data) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        DetailsScreen.routeName,
                        arguments: data.id,
                      );
                      id = data.id - 1;
                    },
                    child: Column(
                      children: [
                        TopAdCard(imgUrl: data.ImgUrl, title:  data.title, price:  data.price)
                      ],
                    ),
                  ),
                )
                    .toList(),

              ],),
            ],
          ),
        ),
      ),
    );
  }
}
