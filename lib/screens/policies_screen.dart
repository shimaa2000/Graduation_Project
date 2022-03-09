import 'package:flutter/material.dart';
import 'package:graduation_project/layout/policiesContent.dart';
import 'package:graduation_project/screens/sign_up.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class PoliciesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Column(
          children: [
            SizedBox(
              width: 5.0,
            ),
            IconButton(
                onPressed: () {Navigator.pushNamed(context, SignUp.routeName);},
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 35,
                  color: Colors.deepPurple,
                ))
          ],
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                text: 'Terms &',
                children: [
                  TextSpan(
                    text: ' Conditions',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w800),
              )),
              SizedBox(height: 15.0,),
              Text('Please read this policies before accepting.', style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 15.0,),
              PoliciesContent(),
              Container(margin: EdgeInsets.symmetric(vertical: 7),
                  child: DefaultButton(onPressedFun: (){Navigator.pushNamed(context, SignUp.routeName);}, text: 'Accept')),
            ],
          ),
        ),
      ),
    );
  }
}
