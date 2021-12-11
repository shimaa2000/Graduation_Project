import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/card_widget.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';
class ActivityTaps extends StatefulWidget {
  const ActivityTaps({Key? key}) : super(key: key);

  @override
  _ActivityTapsState createState() => _ActivityTapsState();
}

class _ActivityTapsState extends State<ActivityTaps> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(text: 'Ads',),
            Tab(text: 'Rent',),
            Tab(text: 'Favourite',),
          ],
        ),
        leading: Icon(Icons.arrow_back),
      ),
      body: TabBarView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                FittedBox(
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
                                  name: data.name,
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
                                  name: data.name,
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
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                FittedBox(
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
                                  name: data.name,
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
                                  name: data.name,
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
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                FittedBox(
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
                                  name: data.name,
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
                                  name: data.name,
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
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
