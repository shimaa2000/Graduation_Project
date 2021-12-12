import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final String date;
  final String url;
  final String notificationMessage;
  const Notifications({Key? key, required this.date, required this.url, required this.notificationMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 7,
        ),
        Text(date,style: Theme.of(context).textTheme.bodyText1,),
        SizedBox(
          height: 7,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 35,
            ),
            SizedBox(width: 7,),
            Text(notificationMessage,style: Theme.of(context).textTheme.headline5),

          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 3,
          color: Colors.black26,
        ),
      ],
    );
  }
}
