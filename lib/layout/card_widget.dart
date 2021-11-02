import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String date;
  final String imgUrl;
  final String title;
  final int price;
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
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(20)),
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
          Container(
              width: 150,
              height: 150,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.contain,
              )),
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
