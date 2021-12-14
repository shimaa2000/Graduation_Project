import 'package:flutter/material.dart';
import 'package:graduation_project/shared/defaultButton.dart';
class FollowersScreen extends StatefulWidget {
  const FollowersScreen({Key? key}) : super(key: key);
  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}
class _FollowersScreenState extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [

              Expanded(
                child: ListView.separated(
                  itemBuilder: (context , index) => buildConnectionItem(),
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) => Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 1,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConnectionItem() => Row(
    children: [
      CircleAvatar(
        radius: 33.0,
        backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
      ),
      SizedBox(width: 15.0,),
      Container(
        width: 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'user name',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ) ,
            ),
            SizedBox(height: 10,),
            Text(
              'Follows you.',
              style:TextStyle(
                color: Colors.black,
                fontSize: 15,
              ) ,
            ),
          ],
        ),
      ),
      SizedBox(width: 40,),
      ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          side: BorderSide(width:1, color:Colors.white),
          minimumSize: Size(110, 40),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          'follow',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    ],
  );


}
