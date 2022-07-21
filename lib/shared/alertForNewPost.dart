import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/imagePicker.dart';

enum ChooseAction { Camera, Gallery }

File? img;

class Alerts {

  static Future<ChooseAction> photoDialog(
    BuildContext context,
    Future userUpdateUserImage({File? image}),
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content: Text(
                'Choose From ?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
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
                          onPressed: () async {
                            final image =
                                await Images().uploadImageFromCamera();
                            if (image != null) {
                              print(image.path);
                             await userUpdateUserImage(image: image);
                            }
                          },
                          child: Text(
                            'Camera',
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
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        DefaultButton(
                          text: 'Gallery',
                          onPressedFun: () async {
                            final image =
                            await Images().uploadImageFromGallery();
                            if (image != null) {
                              print(image.path);
                              await userUpdateUserImage(image: image);
                            }else
                              print('xx${image?.path}');
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
    return (action != null) ? action : ChooseAction.Camera;
  }
}
