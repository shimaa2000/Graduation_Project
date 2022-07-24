import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/form_builder.dart';
import '../network/cubit/update_user_cubit.dart';
import '../network/cubit/update_user_states.dart';
import '../shared/blockCardForEdit.dart';
import '../shared/defaultButton.dart';

class EditProfile extends StatelessWidget {
  static const routeName = 'edit_profile';

  @override
  Widget build(BuildContext context) {
    Color iLight = Colors.black87;
    Color iDark = Colors.white70;
    return Scaffold(
      appBar: AppBar( iconTheme: IconThemeData(color: isDark? Colors.white: Colors.black ),),
      body: BlocConsumer<UpdateUserDataCubit, UpdateUserDataStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var editUserProfile = UpdateUserDataCubit.get(context);
            return SingleChildScrollView(
              child: FormBuilder(builder: (bool Function() validateAndSubmitForm) {
                return Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: isDark? Colors.black: Colors.white,
                              fontSize: 25),
                        )),
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 70, horizontal: 50),
                      padding:
                      EdgeInsets.symmetric(horizontal: 35, vertical: 70),
                      decoration: BoxDecoration(
                          color: isDark? Colors.deepPurple.shade400.withAlpha(20): Colors.grey.shade800,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlockCardForEdit(
                              text: 'Username',
                              controller:
                              editUserProfile.editProfileUserNameController,
                              icon: Icon(Icons.person , color: isDark ? iLight : iDark, )),
                          BlockCardForEdit(
                              text: 'Email',
                              controller:
                              editUserProfile.editProfileEmailController,
                              icon: Icon(Icons.email, color: isDark ? iLight : iDark,)),
                          BlockCardForEdit(
                              text: 'Address',
                              controller:
                              editUserProfile.editProfileAddressController,
                              icon: Icon(Icons.home, color: isDark ? iLight : iDark,)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                      txtColor: isDark? Colors.white: Colors.black,
                        onPressedFun: () {
                          // print(editUserProfile.editProfileUserNameController.text);
                          // print(editUserProfile.editProfileEmailController.text);
                          // print(editUserProfile.editProfileAddressController.text);
                          if(validateAndSubmitForm()){
                            editUserProfile.updateUserData();
                          }
                          Navigator.pushNamed(context, StartApp.routeName);
                        },
                        text: 'Save' )
                  ],
                );
              },),
            );
          }),
    );
  }
}
