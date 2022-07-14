import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function onPressedFun;
  final String text;
  bool enable;
 // final Color btnColor;
  final Color txtColor;
  final double height;
  final double width;
   DefaultButton({
    Key? key,
     this.enable=true,
     this.height = 50,
     this.width=130,
     this.txtColor = Colors.white,
     //this.btnColor = Colors.deepPurple,
    required this.onPressedFun,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          //primary: btnColor,
          minimumSize: Size(width, height),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: txtColor),
        ),
        onPressed: enable?onPressedFun as Function():null,
      ),
    );
  }
}
