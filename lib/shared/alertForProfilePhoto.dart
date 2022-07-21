import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/update_user_cubit.dart';
import 'package:graduation_project/network/cubit/update_user_states.dart';
import 'package:graduation_project/shared/alertForNewPost.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/popUp.dart';

enum Action { View, Change }

class Choose {
  static Future<Action> chooseDialog(
    BuildContext context,
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return BlocConsumer<UpdateUserDataCubit, UpdateUserDataStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = UpdateUserDataCubit.get(context);
                return Center(
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    content: Text(
                      'You Want..',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    actions: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  //   showDialog(
                                  //       context: context,
                                  //      // builder: (_) =>
                                  // ImageDialog(ImgUrl: ));
                                },
                                child: Text(
                                  'View',
                                ),
                                style: TextButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.deepPurple,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  minimumSize: Size(130, 50),
                                  textStyle: TextStyle(
                                      color: Colors.deepPurple, fontSize: 20),
                                  backgroundColor: Colors.white,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              DefaultButton(
                                text: 'Change',
                                onPressedFun: () async {
                                  await Alerts.photoDialog(
                                      context, cubit.userUpdateUserImage);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
    return (action != null) ? action : Action.View;
  }
}
