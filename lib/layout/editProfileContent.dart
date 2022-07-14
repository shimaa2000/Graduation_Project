import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/shared/blockCardForEdit.dart';
import 'package:graduation_project/shared/boxtextfield.dart';

class EditProfileContent extends StatelessWidget {
  const EditProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LayoutCubit, LayoutStates>(builder: (context, state){
      var layout = LayoutCubit.get(context);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Form(
            key: layout.editProfileFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                BlockCardForEdit(text: 'Username', controller: layout.editProfileUserNameController, icon: Icon(Icons.person)),
                BlockCardForEdit(text: 'Email', controller: layout.editProfileEmailController, icon: Icon(Icons.email)),
                BlockCardForEdit(text: 'Old Password', controller: layout.editProfilePasswordController, icon: Icon(Icons.lock)),
                BlockCardForEdit(text: 'New Password', controller: layout.editProfileNewPasswordController, icon: Icon(Icons.lock)),
                BlockCardForEdit(text: 'Confirm New Password', controller: layout.editProfileConfirmPasswordController, icon: Icon(Icons.lock)),
                BlockCardForEdit(text: 'Address', controller: layout.editProfileAddressController, icon: Icon(Icons.home)),

              ],
            ),
          ),
        ),
      );
    }
    , listener: (context, state){});
  }
}

