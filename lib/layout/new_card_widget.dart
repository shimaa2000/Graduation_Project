import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/image_card.dart';
import 'package:graduation_project/models/postsModel.dart';
import 'package:graduation_project/shared/fav_button.dart';
import 'package:graduation_project/shared/popUp.dart';

List<PostModel> fav_list = new List.empty(growable: true);

class NewCardWidget extends StatefulWidget {
  final String name;
  final String date;
  final String imgUrl;
  final String title;
  final int price;
  final String size;
  bool isFav;
  final int index;
  final double width;
  final double height;

  NewCardWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.size,
    this.isFav = false,
    this.width = 200,
    this.height = 250,
    required this.index,
  }) : super(key: key);

  @override
  _NewCardWidgetState createState() => _NewCardWidgetState();
}

class _NewCardWidgetState extends State<NewCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageCard(imageUrl: widget.imgUrl),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * .40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: isDark? Colors.white :Colors.grey.shade800,
                border: Border.all(width: 1.5, color: Colors.transparent),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: isDark? Colors.black: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(widget.name,
                        style: TextStyle(
                            color: isDark? Colors.black: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Text('\$${widget.price}',
                        style: TextStyle(
                            color:  isDark? Colors.red: Colors.red.shade300,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.size,
                          style: TextStyle(color: isDark? Colors.black: Colors.white70, fontSize: 16),
                        ),
                        FavoriteIcon(index: widget.index, isFav: widget.isFav,)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
