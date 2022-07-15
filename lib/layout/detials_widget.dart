import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/layout/rating.dart';
import 'package:graduation_project/layout/toggel_details.dart';

class DetailsWidget extends StatefulWidget {
  final String type;
  final String title;
  final String price;
  final String size;
  final String gender;
  final String date;
  final String description;
  final String height;
  final String width;
  final String imageUrl;

  DetailsWidget({
    Key? key,
    required this.type,
    required this.size,
    required this.title,
    required this.price,
    required this.gender,
    required this.date,
    required this.description,
    required this.height,
    required this.width,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  var rating = 3.5;
  bool _isVertical = false;
  bool isFav = false;
  Color active = Colors.deepPurple;
  bool isActive1 = true;
  bool isActive2 = false;
  bool isActive3 = false;
  int listIndex = 0;

  @override
  Widget build(BuildContext context) {
    double value = 3.5;
    List<Widget> toggle = [
      ToggleDetails.item(() {}, context, widget.type, widget.size, widget.gender, widget.date),
      ToggleDetails.detail(context, widget.description, widget.height, widget.width),
      ToggleDetails.review(context)
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.5, color: Colors.black26),
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Image.asset(
                          widget.imageUrl,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(30),
                    child: isFav
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            icon: Icon(Icons.favorite),
                            iconSize: 35,
                            color: Colors.deepPurple,
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            icon: Icon(
                              Icons.favorite_border,
                            ),
                            iconSize: 35,
                            color: Colors.deepPurple,
                          ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(
                  //   width: 15,
                  // ),
                  Column(children: [
                    Text(widget.title, style: Theme.of(context).textTheme.headline1),
                    Row(children: [
                      Text(widget.price, style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(
                        width: 10,
                      ),
                      Text('EGP', style: Theme.of(context).textTheme.bodyText1)
                    ])
                  ]),
                  // SizedBox(width: MediaQuery.of(context).size.width*(2.5/7),),
                  new StarRating(
                    rating: rating,
                    onRatingChanged: (rating) => setState(() => this.rating = rating),
                    color: Colors.deepPurple,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 1,
                color: Colors.black26,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              listIndex = 0;
                              isActive1 = true;
                              isActive2 = false;
                              isActive3 = false;
                            });
                          },
                          child: Text('Item')),
                      Container(
                        // margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4.5,
                        height: 2,
                        color: isActive1 ? Colors.deepPurple : Colors.black26,
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6.5,
                  ),
                  Column(
                    children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              listIndex = 1;
                              isActive2 = true;
                              isActive1 = false;
                              isActive3 = false;
                            });
                          },
                          child: Text('Details')),
                      Container(
                        // margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 4.5,
                        height: 2,
                        color: isActive2 ? Colors.deepPurple : Colors.black26,
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6.5,
                  ),
                  Column(
                    children: [
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              listIndex = 2;
                              isActive3 = true;
                              isActive2 = false;
                              isActive1 = false;
                            });
                          },
                          child: Text('Review')),
                      Container(
                        // margin: EdgeInsets.only(t5),
                        width: MediaQuery.of(context).size.width / 4.5,
                        height: 2,
                        color: isActive3 ? Colors.deepPurple : Colors.black26,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: toggle[listIndex],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
