import 'package:flutter/material.dart';
import 'package:graduation_project/layout/profile_followers.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/alertForProfilePhoto.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/imagePicker.dart';
String imgUrl='images/photourl.jpg';
class ProfileContainer extends StatelessWidget {
 final String userName;
 final String userAddress;
  const ProfileContainer({Key? key,required this.userName, required this.userAddress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250.0,
          color: Colors.deepPurple,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              width: 320.0,
              height: 440.0,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.9),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.grey.shade500,
                  width: 3.0,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {Choose.ChooseDialog(context);},
                      child: CircleAvatar(
                        radius: 70.0,
                       backgroundImage: AssetImage(imgUrl,) ,
                       ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      userAddress,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade400),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    ProfileFollowers(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        DefaultButton(
                            onPressedFun: () {}, text: 'message'),
                        DefaultButton(
                            onPressedFun: () {}, text: 'follow'),
                      ],
                    )
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
