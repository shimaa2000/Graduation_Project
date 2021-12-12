import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/message_widget.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurple,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...DUMMY_MESSAGES
                  .map(
                    (data) => InkWell(
                  onTap: () {
                  },
                  child:MessageWidget(message: data.message, date: data.date, userName: data.username, imageUrl: data.imageUrl,),
                ),
              )
                  .toList()
            ],

          ),
        ),
      ),
    );
  }
}
