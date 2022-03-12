import 'package:flutter/material.dart';
import 'package:graduation_project/shared/blockCardForEdit.dart';
import 'package:graduation_project/shared/boxtextfield.dart';

class EditProfileContent extends StatelessWidget {
  const EditProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userNameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var newPasswordController = TextEditingController();
    var addressController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            BlockCardForEdit(text: 'Username', controller: userNameController, icon: Icon(Icons.person)),
            BlockCardForEdit(text: 'Email', controller: emailController, icon: Icon(Icons.email)),
            BlockCardForEdit(text: 'Old Password', controller: passwordController, icon: Icon(Icons.lock)),
            BlockCardForEdit(text: 'New Password', controller: newPasswordController, icon: Icon(Icons.lock)),
            BlockCardForEdit(text: 'Confirm New Password', controller: confirmPasswordController, icon: Icon(Icons.lock)),
            BlockCardForEdit(text: 'Address', controller: addressController, icon: Icon(Icons.home)),

          ],
        ),
      ),
    );
  }
}

