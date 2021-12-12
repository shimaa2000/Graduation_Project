import 'package:flutter/material.dart';
import 'package:graduation_project/layout/message_widget.dart';
import 'package:graduation_project/models/chat_model.dart';

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
              ...chats
                  .map(
                    (data) => InkWell(
                  onTap: () {
                  },
                  child:MessageWidget(message: data.text, date: data.time, userName: data.sender.name, imageUrl: data.sender.imageUrl,),
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
