import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/screens/homeScreen.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key, required this.ImgUrl}) : super(key: key);
 final String ImgUrl;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Hero(
        tag: 'preview',
        child: Image(
          image: NetworkImage(ImgUrl),
          fit: BoxFit.cover,
        ),
      )
    );
  }
}
// Container(
// width: 400,
// height: 400,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// image: DecorationImage(
// image: AssetImage(DUMMY_DATA[id].ImgUrl),
// fit: BoxFit.fill,
// ),
// ),
// ),