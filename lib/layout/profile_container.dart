import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/shared/alertForProfilePhoto.dart';

class ProfileContainer extends StatelessWidget {
  final String userName;
  final String userAddress;
  final String imgUrl;
  const ProfileContainer({Key? key,required this.userName, required this.userAddress, required this.imgUrl,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250.0,
          color: Theme.of(context).primaryColor,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              padding: EdgeInsets.all(50),
              width: 320.0,
              //height: 440.0,
              decoration: BoxDecoration(
                color: isDark?Colors.white.withOpacity(.9): Colors.black45,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.grey.shade600,
                  width: 3.0,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {Choose.chooseDialog(context);},
                      child: CircleAvatar(
                        radius: 70.0,
                        backgroundImage: NetworkImage(imgUrl) ,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      userName,
                      style:Theme.of(context).textTheme.headline1
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      userAddress,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          color: isDark?Colors.grey:Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
