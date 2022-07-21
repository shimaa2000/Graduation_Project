import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
    return Scaffold(
      appBar: AppBar(),
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
                              color: Colors.black,
                              fontSize: 25),
                        )),
                    Container(
                      margin:
                      EdgeInsets.symmetric(vertical: 80, horizontal: 50),
                      padding:
                      EdgeInsets.symmetric(horizontal: 35, vertical: 70),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade400.withAlpha(20),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlockCardForEdit(
                              text: 'Username',
                              controller:
                              editUserProfile.editProfileUserNameController,
                              icon: Icon(Icons.person)),
                          BlockCardForEdit(
                              text: 'Email',
                              controller:
                              editUserProfile.editProfileEmailController,
                              icon: Icon(Icons.email)),
                          BlockCardForEdit(
                              text: 'Address',
                              controller:
                              editUserProfile.editProfileAddressController,
                              icon: Icon(Icons.home)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultButton(
                        onPressedFun: () {
                          // print(editUserProfile.editProfileUserNameController.text);
                          // print(editUserProfile.editProfileEmailController.text);
                          // print(editUserProfile.editProfileAddressController.text);
                          if(validateAndSubmitForm()){
                            editUserProfile.updateUserData();
                          }
                          Navigator.pushNamed(context, StartApp.routeName);
                        },
                        text: 'Save')
                  ],
                );
              },),
            );
          }),
    );
  }
}
