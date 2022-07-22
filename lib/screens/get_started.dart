import 'package:flutter/material.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/screens/sign_up.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Image.asset(
                'images/logo.png',
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to Dressuit',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 7,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                Text(
                  'Easily find clothes for your special occasion.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),Text(
                  'Our ambition is to make you feel confident',
                  style: Theme.of(context).textTheme.bodyText1,
                ),Text(
                  ' and beautiful.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 165,
                height: 50,
                child: ElevatedButton(

                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(width: 10.0,),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65.0),
                child: Row(
                  children: [
                    Text(
                      "You don't have an account ?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(SignUp.routeName);
                    }, child: Text('Sign up ' ,style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor),))
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

