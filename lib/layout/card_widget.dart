import 'package:flutter/material.dart';
import 'package:graduation_project/shared/circular_container.dart';
import 'package:graduation_project/shared/imageContainer.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String date;
  final String imgUrl;
  final String title;
  final double price;
  final String size;
  final bool isFav;
  final double width;
  final double height;

  const CardWidget({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      height: height,
      width: width,
      padding: 3.0,
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  // fixedSize: Size(10, 10),
                  // <-- Splash color
                ),
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          ImageContainer(height: 160, width: 150, imgUrl: imgUrl),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
