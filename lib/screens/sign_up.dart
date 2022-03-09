import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/complete_screen.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/screens/policies_screen.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
class SignUp extends StatefulWidget {
  static const routeName='sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  var nameController = TextEditingController();
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var confirmPassController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  var agree =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset('images/background.png', height: MediaQuery.of(context).size.height*0.35,
                    width:MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35,top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],),
              Container(
                 alignment: Alignment.center,
                 width:320,
                 child: Form(
                   key:formKey ,
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       BoxTextField(
                         controller:nameController ,
                         autofocus: true ,
                         keyboardType: TextInputType.name ,
                           onTap: (){},
                         icon: Icon(Icons.person,),
                          validatorText: 'please enter name',
                       ),
                       SizedBox(height: 10,),
                       BoxTextField(
                         controller:emailController ,
                         autofocus: true,
                         keyboardType: TextInputType.emailAddress ,
                           onTap: (){},
                         icon: Icon(Icons.email,),
                          validatorText: 'please enter mail',
                       ),
                       SizedBox(height: 10,),
                       BoxTextField(
                         controller:passwordController ,
                         autofocus: true,
                         keyboardType: TextInputType.visiblePassword ,
                           onTap: (){},
                         obsecure: true,
                         icon: Icon(Icons.lock,),
                           validatorText: 'please enter password',
                       ),
                       SizedBox(height: 10,),
                       BoxTextField(
                         controller:confirmPassController ,
                         autofocus: true,
                         keyboardType: TextInputType.name ,
                         onTap: (){},
                         obsecure: true,
                         icon: Icon(Icons.lock,),
                           validatorText: 'please confirm password',
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Checkbox(
                             value:agree ,
                             onChanged: (value){
                             setState(() {
                            agree = value ?? false;
                             });

                           },),
                           RichText(
                               text:TextSpan(
                                 children: [
                                   TextSpan(text: 'accept',
                                     style: TextStyle(
                                       fontSize: 13,
                                       color: Colors.black,
                                     ),
                                   ),
                                   TextSpan(
                                       text: ' policies and terms',
                                       style: TextStyle(
                                         fontSize: 14,
                                         color: Colors.blueAccent[400],
                                         fontWeight: FontWeight.bold,
                                       ),
                                       recognizer: TapGestureRecognizer()
                                         ..onTap = () {
                                           Navigator.push(context,
                                             MaterialPageRoute(builder: (context) => PoliciesScreen(),
                                             ),
                                           );
                                         }),
                                 ],
                               ),),
                         ],
                       ),
                       SizedBox(height: 15,),
                       DefaultButton(
                           text: 'Next',
                         onPressedFun: (){
                         if(formKey.currentState!.validate()){
                           Navigator.push(context,
                             MaterialPageRoute(builder: (context) => CompleteScreen(), ),);
                         }
                       },
                           ),
                       SizedBox(height: 10,),
                       Center(
                         child: RichText(
                           text:TextSpan(
                             children: [
                               TextSpan(text: 'Already have account ?',
                                 style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.black,
                                 ),
                               ),
                               TextSpan(
                                   text: 'Login',
                                   style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.deepPurple,
                                     fontWeight: FontWeight.bold,
                                   ),
                                   recognizer: TapGestureRecognizer()
                                     ..onTap = () {
                                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                                     }),
                             ],
                           ),),
                       ),
                       SizedBox(height: 10,),
                     ],
                   ) ,
                 ),
               ),
            ],
          ),
        ),
      ) ,
    );
  }
}



