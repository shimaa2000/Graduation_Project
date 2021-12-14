import 'package:flutter/material.dart';
import 'package:graduation_project/layout/message_widget.dart';
import 'package:graduation_project/models/chat_model.dart';
import 'package:graduation_project/screens/chat_screen.dart';
import 'package:graduation_project/screens/connection_screen.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

int indexM = 0;

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ConnectionScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...chats
                  .map(
                    (data) => InkWell(
                      onTap: () {},
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              indexM = data.sender.id;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChatScreen(user: data.sender)),
                              );
                            });
                          },
                          child: MessageWidget(
                            message: data.text,
                            date: data.time,
                            userName: data.sender.name,
                            imageUrl: data.sender.imageUrl,
                          )),
                    ),
                  )
                  .toList()
            ],
          ),

        ),

    );
  }
}
