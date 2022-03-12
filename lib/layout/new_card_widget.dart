import 'package:flutter/material.dart';
class NewCardWidget extends StatelessWidget {
  final String name;
  final String date;
  final String imgUrl;
  final String title;
  final double price;
  final String size;
  final bool isFav;
  final double width;
  final double height;

  const NewCardWidget({
    Key? key,
    required this.name,
    required this.date,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.size,
    this.isFav = false,
    this.width = 200,
    this.height = 250,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width*.46,
              // margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  image: new DecorationImage(image:  AssetImage(
                      imgUrl
                  ),fit: BoxFit.cover,),
                  border: Border.all(width: 2.5,color:Colors.transparent ),
                  borderRadius: BorderRadius.circular(10),color: Colors.transparent),

            ),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width*.40,
              decoration: BoxDecoration(
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                border: Border.all(width: 1.5,color: Colors.transparent),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                    Text(name,style: TextStyle(color: Colors.black26,fontSize: 18,fontWeight: FontWeight.w500)),
                    Text('\$$price',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w500)),

                    Text(size,style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            )
          ],),
      ),
    );
  }
}
