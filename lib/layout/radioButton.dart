import 'package:flutter/material.dart';
import 'package:graduation_project/screens/search_screen.dart';

// ignore: must_be_immutable
class RadioButtonClass extends StatelessWidget {
  final String title1;
  var value1;
  final String title2;
  final double sizedHeight;
  var value2;
  var groupValue;
  final ValueChanged<dynamic> onChange1;
  final ValueChanged<dynamic> onChange2;


  RadioButtonClass({
    Key? key,
    required this.title1,
    required this.value1,
    required this.title2,
    required this.value2,
    required this.groupValue,
    required this.onChange1,
    required this.onChange2, required this.sizedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(width: sizedHeight,),
              Container(
                  width: 25,
                  child: Radio(
                    activeColor: Colors.deepPurple,
                    value: value1,
                    groupValue: groupValue,
                    onChanged: (dynamic d) => onChange1(d),
                  )),
              Text(
                title1,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Row(
            textBaseline: TextBaseline.ideographic,
            children: [
              Container(
                width: 25,
                child: Radio(
                  activeColor: Theme.of(context).primaryColor,

                  value: value2,
                  groupValue: groupValue,
                  onChanged: (dynamic d) => onChange2(d),
                ),
              ),
              //  SizedBox(width: 10,),
              Text(
                title2,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
