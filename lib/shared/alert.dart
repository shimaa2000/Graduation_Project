import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/shared/defaultButton.dart';

enum DialogAction { ok, cancle }
//Future<String> _execute(Function function) async { }
class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    Widget? body,
    String? textforText,
    String? textforElevate,
    VoidCallback forElevatedButton,
      VoidCallback forTextButton,

      String? imageUrl,
    double? width,
    double? height,
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),

              //title: title,
              content: body,
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      imageUrl!,
                      width: width,
                      height: height,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: forTextButton,
                          child: Text(
                            textforText!,
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
                          text: textforElevate!,
                          onPressedFun: forElevatedButton,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
    return (action != null) ? action : DialogAction.cancle;
  }
}
