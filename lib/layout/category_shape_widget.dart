import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/shared/listFemale.dart';
import 'package:graduation_project/shared/listMale.dart';
import 'package:graduation_project/shared/listView.dart';

class CategoryShape extends StatefulWidget {
  final String text1;
  final String text2;
  String categories = 'all';
  bool clicked1;
  bool clicked2;
  bool clicked3 = true;

  CategoryShape(
      {Key? key,
      required this.text1,
      this.clicked1 = false,
      required this.text2,
      this.clicked2 = false})
      : super(key: key);

  @override
  _CategoryShapeState createState() => _CategoryShapeState();
}

class _CategoryShapeState extends State<CategoryShape> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  widget.clicked1 = false;
                  widget.clicked2 = false;
                  widget.clicked3 = true;
                  widget.categories = 'all';
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: widget.clicked3
                        ? Theme.of(context).primaryColor
                        : isDark
                            ? Colors.white
                            : Colors.grey.shade800),
                child: Text(
                  'All',
                  style: TextStyle(
                      color: isDark
                          ? widget.clicked3
                              ? Colors.white
                              : Colors.black
                          : widget.clicked3
                              ? Colors.black
                              : Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.clicked1 = true;
                  widget.clicked2 = false;
                  widget.clicked3 = false;
                  widget.categories = widget.text1;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: widget.clicked1
                        ? Theme.of(context).primaryColor
                        : isDark
                            ? Colors.white
                            : Colors.grey.shade800),
                child: Text(
                  widget.text1,
                  style: TextStyle(
                      color: isDark
                          ? widget.clicked1
                              ? Colors.white
                              : Colors.black
                          : widget.clicked1
                              ? Colors.black
                              : Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.clicked1 = false;
                  widget.clicked3 = false;
                  widget.clicked2 = true;
                  widget.categories = widget.text2;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: widget.clicked2
                        ? Theme.of(context).primaryColor
                        : isDark
                            ? Colors.white
                            : Colors.grey.shade800),
                child: Text(
                  widget.text2,
                  style: TextStyle(
                      color: isDark
                          ? widget.clicked2
                              ? Colors.white
                              : Colors.black
                          : widget.clicked2
                              ? Colors.black
                              : Colors.white),
                ),
              ),
            ),
          ],
        ),
        widget.categories == 'Male' ? ListMale() : widget.categories == 'Female'?ListFemale():ListViewBuilderData(),
      ],
    );
  }
}
