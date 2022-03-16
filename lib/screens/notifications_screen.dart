import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/notifications_widget.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName='notification_screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(centerTitle: true,backgroundColor: Colors.deepPurple,title: Text('Notification'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...DUMMY_NOTIFICATION
                .map(
                  (data) => InkWell(
                onTap: () {
                },
                child: Notifications(date:data.date ,url: data.url,notificationMessage: data.notificationMessage),
              ),
            )
                .toList()
          ],
        ),
      ),
    );
  }
}


