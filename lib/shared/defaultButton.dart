import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function onPressedFun;
  final String text;
  bool enable;
   DefaultButton({
    Key? key,
     this.enable=true,
    required this.onPressedFun,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          minimumSize: Size(130, 50),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: enable?onPressedFun as Function():null,
      ),
    );
  }
}
