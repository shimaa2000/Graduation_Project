import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String imgUrl;

  const ImageContainer({Key? key,
    required this.height,
    required this.width,
    required this. imgUrl,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          image: new DecorationImage(image:  NetworkImage(
            imgUrl,
          ),fit: BoxFit.cover,),
          border: Border.all(width: 2.5, color: Colors.black26),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
