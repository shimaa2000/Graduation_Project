import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/card_widget.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 10.0),
              child: Container(
                width: double.infinity,
                height: 36.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'Search',
                        style:
                        TextStyle(color: Colors.grey, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(child: Container(child: SingleChildScrollView(
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
          ),),)
        ],
      ),
    );
  }
}
