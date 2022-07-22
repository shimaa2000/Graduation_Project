import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final double padding;
  final Widget child;
  const CircularContainer({Key? key, required this.width, required this.height, required this.padding, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: width,
      height: height,
      margin: const EdgeInsets.all(15.0),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(20)),
      child: child,);
  }
}