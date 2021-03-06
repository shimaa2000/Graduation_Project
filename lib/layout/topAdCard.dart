import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/shared/imageContainerForTopAd.dart';
import 'package:graduation_project/shared/popUp.dart';

class TopAdCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final double price;

  const TopAdCard({Key? key, required this.imgUrl, required this.title, required this.price,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  //  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.2, 0.5),
                        spreadRadius: 0.5),
                  ],
                ),
                width: 170,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {showDialog(context: context, builder: (_)=>ImageDialog(ImgUrl: DUMMY_DATA[id].ImgUrl,));},
                          child: ImageContainerForTopAd(
                              height: 140,
                              width: 160,
                              imgUrl:DUMMY_DATA[id].ImgUrl)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          Text(
                            '\$${price.toString()}',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

        ),

    );
  }
}

