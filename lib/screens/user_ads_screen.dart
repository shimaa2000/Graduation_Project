import 'package:flutter/material.dart';
import 'package:graduation_project/layout/card_widget.dart';

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
                      index = data.id - 1;
                    },
                    child: Column(
                      children: [
                        CardWidget(
                          name: 'You',
                          date: data.date,
                          imgUrl: data.ImgUrl,
                          title: data.title,
                          price: data.price,
                          size: data.size,
                          isFav: data.isFav,
                        ),
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
                      index = data.id - 1;
                    },
                    child: Column(
                      children: [
                        CardWidget(
                          name: 'You',
                          date: data.date,
                          imgUrl: data.ImgUrl,
                          title: data.title,
                          price: data.price,
                          size: data.size,
                          isFav: data.isFav,
                        ),
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
