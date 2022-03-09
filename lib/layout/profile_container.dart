import 'package:flutter/material.dart';
import 'package:graduation_project/layout/profile_followers.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/imagePicker.dart';
class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key}) : super(key: key);

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
                      onTap: () => Dialogs.yesAbortDialog(context,
                          Text('Choose', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, ),textAlign: TextAlign.center,), 'Camera', 'Gallery', () {
                            Images().uploadImageFromGallery();
                          }, () {
                            Images().uploadImageFromCamera();
                          }, 'images/logo.png', 200, 200),
                      child: CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'UserName',
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Menofia, Egypt',
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
