import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/network/cubit/update_user_cubit.dart';
import 'package:graduation_project/network/cubit/update_user_states.dart';
import 'package:graduation_project/shared/defaultButton.dart';


import 'alertForProfile.dart';

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
                    backgroundColor: isDark? Colors.white: Colors.black ,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    content: Text(
                      'You Want..',
                      style:
                      Theme.of(context).textTheme.headline3,
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

                                },
                                child: Text(
                                  'View',
                                  style: TextStyle(color: isDark? Colors.black: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  minimumSize: Size(130, 50),
                                  textStyle: TextStyle(
                                      color: Theme.of(context).primaryColor, fontSize: 20),
                                  backgroundColor: isDark? Colors.white: Colors.black,
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
                                txtColor: isDark? Colors.white: Colors.black,
                                text: 'Change',
                                onPressedFun: () async {
                                  await ProfileAlert.photoDialog(
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
