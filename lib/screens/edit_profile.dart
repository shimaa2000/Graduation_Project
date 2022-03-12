import 'package:flutter/material.dart';
import 'package:graduation_project/layout/editProfileContent.dart';
import 'package:graduation_project/screens/profile.dart';
import '../shared/defaultButton.dart';

class EditProfile extends StatelessWidget {
  static const routeName = 'edit_profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Align(
              alignment: Alignment.center,
                child: Text('Edit Profile', style:TextStyle( fontWeight: FontWeight.w400,color: Colors.black, fontSize: 25),)),
            EditProfileContent(),
            SizedBox(height: 10,),
            DefaultButton(onPressedFun: (){Navigator.pushNamed(context, Profile.routeName);}, text: 'Save')
          ],
        ),
      ),
    );
  }
}
