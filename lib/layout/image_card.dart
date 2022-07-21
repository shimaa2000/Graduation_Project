import 'package:flutter/material.dart';
import 'package:graduation_project/shared/popUp.dart';
class ImageCard extends StatelessWidget {
  final String imageUrl;
  const ImageCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (_) => ImageDialog(ImgUrl:imageUrl,));
      },
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width * .46,
        // margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            image: new DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(width: 2.5, color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent),
      ),
    );
  }
}
