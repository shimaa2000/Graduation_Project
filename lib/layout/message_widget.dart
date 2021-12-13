import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String message;
  final String date;

  const MessageWidget(
      {Key? key,
      required this.imageUrl,
      required this.userName,
      required this.message,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 35,
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        userName,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        date,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Container(
                    width: 280,
                    padding: new EdgeInsets.only(right: 13.0),
                    child: Text(
                      message,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 5,
          color: Colors.black26,
        ),
      ],
    );
  }
}
