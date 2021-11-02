import 'package:flutter/material.dart';
import '../shared/boxtextfield.dart';
import '../shared/defaultButton.dart';

class EditProfile extends StatelessWidget {
  static const routeName='edit_profile';
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var addressController =TextEditingController();
  var phoneController =TextEditingController();
  var formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                SizedBox(height: 25,),
                Container(
                  width: 300,
                  child: Form(
                    key:formKey ,
                    child:Column(
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BoxTextField(
                            controller:userNameController ,
                            autofocus: true ,
                            label: "username" ,
                            keyboardType: TextInputType.name ,
                            hint: '',
                            icon: Icon(Icons.person,),
                            onTap: (){},
                            validator: (value) {
                              if (value ==null || value.isEmpty) {
                                return 'please confirm your name';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 20,),
                        BoxTextField(
                            controller:emailController ,
                            autofocus: true,
                            label: "email" ,
                            keyboardType: TextInputType.emailAddress ,
                            hint: '',
                            onTap: (){},
                            icon: Icon(Icons.email,),
                            validator: (value) {
                              if (value ==null || value.isEmpty) {
                                return 'please enter your email';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 10,),
                        BoxTextField(
                            controller:passwordController ,
                            autofocus: true,
                            label: 'password' ,
                            keyboardType: TextInputType.visiblePassword ,
                            hint: '',
                            onTap: (){},
                            obsecure: true,
                            icon: Icon(Icons.lock,),
                            validator: (value) {
                              if (value ==null || value.isEmpty) {
                                return 'please enter your password';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 10,),
                        BoxTextField(
                            controller:newPasswordController ,
                            autofocus: true,
                            label: 'new password' ,
                            keyboardType: TextInputType.visiblePassword ,
                            hint: '',
                            onTap: (){},
                            obsecure: true,
                            icon: Icon(Icons.lock,),
                            validator: (value) {
                              if (value ==null || value.isEmpty) {
                                return 'please enter your new password';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 10,),
                        BoxTextField(
                            controller:addressController ,
                            autofocus: true,
                            label: "Address" ,
                            onTap: (){},
                            keyboardType: TextInputType.streetAddress ,
                            hint: '',
                            icon: Icon(Icons.home,),
                            validator: (value) {
                              if (value ==null || value.isEmpty) {
                                return 'please confirm your address';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 10,),
                        BoxTextField(
                            controller:phoneController ,
                            autofocus: true,
                            onTap: (){},
                            label: 'Phone Number' ,
                            keyboardType: TextInputType.phone,
                            hint: '',
                            obsecure: true,
                            icon: Icon(Icons.phone,),
                            validator: (value) {
                              if (value ==null || value.isEmpty) {
                                return 'please enter your phone';
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: 30,),
                        DefaultButton(onPressedFun: (){
                          if(formKey.currentState!.validate()){
                            print(userNameController.text);
                            print(passwordController.text);
                            print(newPasswordController.text);
                            print(addressController.text);
                            print(phoneController.text);


                          }

                        },
                            text: 'Save'
                        ),

                      ],
                    ) ,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
