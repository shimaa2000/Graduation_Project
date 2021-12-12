import 'package:flutter/material.dart';
class MessageWidget extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String message;
  final String date;
  const MessageWidget({Key? key, required this.imageUrl, required this.userName, required this.message, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Row(children:[ Text(userName,style: Theme.of(context).textTheme.headline5),
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                ),Text(date,style: Theme.of(context).textTheme.bodyText1,),],),

                Text(message,style: Theme.of(context).textTheme.headline5,),
              ],
            )
          ],
        ),

        Container(
                    width: double.infinity,
          height: 5,
          color: Colors.black26,
        )
      ],
    );
  }
}
