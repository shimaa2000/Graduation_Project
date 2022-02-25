import 'package:flutter/material.dart';
import 'package:graduation_project/screens/profile.dart';
import '../shared/boxtextfield.dart';
import '../shared/defaultButton.dart';

class EditProfile extends StatelessWidget {
  static const routeName = 'edit_profile';
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
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
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 300,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        BoxTextField(
                          controller: userNameController,
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          icon: Icon(
                            Icons.person,
                          ),
                          onTap: () {},
                          validatorText: 'please enter name',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BoxTextField(
                          controller: emailController,
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          onTap: () {},
                          icon: Icon(
                            Icons.email,
                          ),
                          validatorText: 'please enter mail',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BoxTextField(
                          controller: passwordController,
                          autofocus: true,
                          keyboardType: TextInputType.visiblePassword,
                          onTap: () {},
                          obsecure: true,
                          icon: Icon(
                            Icons.lock,
                          ),
                          validatorText: 'please enter old password',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BoxTextField(
                          controller: newPasswordController,
                          autofocus: true,
                          keyboardType: TextInputType.visiblePassword,
                          onTap: () {},
                          obsecure: true,
                          icon: Icon(
                            Icons.lock,
                          ),
                          validatorText: 'please enter new password',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BoxTextField(
                          controller: addressController,
                          autofocus: true,
                          onTap: () {},
                          keyboardType: TextInputType.streetAddress,
                          icon: Icon(
                            Icons.home,
                          ),
                          validatorText: 'please enter address',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BoxTextField(
                          controller: phoneController,
                          autofocus: true,
                          onTap: () {},
                          keyboardType: TextInputType.phone,
                          obsecure: true,
                          icon: Icon(
                            Icons.phone,
                          ),
                          validatorText: 'please enter phone number',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        DefaultButton(
                          text: 'Save',
                          onPressedFun: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, Profile.routeName);
                            }
                          },
                        ),
                      ],
                    ),
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
