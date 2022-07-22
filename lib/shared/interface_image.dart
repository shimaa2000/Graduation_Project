import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
class InterfaceImage extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final double forHeight;
  final double sizedHeight;
  final double sizedWidth;
  const InterfaceImage({Key? key, required this.firstLabel, required this.secondLabel, required this.forHeight, required this.sizedHeight, required this.sizedWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        isDark? Image.asset(
          'images/background.png',
          height: MediaQuery.of(context).size.height * forHeight,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ):Image.asset(
          'images/backgroundDark.png',
          height: MediaQuery.of(context).size.height * forHeight,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 23, top: 60),
          child: Row(
            children: [
              SizedBox(width: sizedWidth,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: sizedHeight,
                  ),
                  Text(
                    firstLabel,
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                  ),
                  Text(
                    secondLabel,
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
