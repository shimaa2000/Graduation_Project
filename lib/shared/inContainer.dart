import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/shared/alert.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class InContainer extends StatelessWidget {
  const InContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LayoutCubit, LayoutStates>(builder: (context, state){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child:  BoxTextField(
              onTap: (){},
              obsecure: true,
              controller: LayoutCubit().controller1,
              validatorText: 'please enter password',
              icon: Icon(
                Icons.lock,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: BoxTextField(
              onTap: (){},
              obsecure: true,
              controller: LayoutCubit().controller2,
              validatorText: 'please confirm password',
              icon: Icon(
                Icons.lock,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DefaultButton(
              onPressedFun: () => Dialogs.yesAbortDialog(context, Text('You can login to your account now!'), 'Cancel', 'Login', () { Navigator.pushNamed(context, LoginScreen.routeName);},(){Navigator.of(context).pop(DialogAction.cancle);
              }, 'images/check.svg', 200 , 200),
              text: 'Save'),
        ],
      );
    }, listener: (context, state){});
  }
}
