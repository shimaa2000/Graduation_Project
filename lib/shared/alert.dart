import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/shared/defaultButton.dart';

enum DialogAction { ok, cancle }

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
              backgroundColor: isDark ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
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
                            style: TextStyle(
                                color: isDark ? Colors.black : Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                                style: BorderStyle.solid),
                            minimumSize: Size(130, 50),
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                            backgroundColor:
                                isDark ? Colors.white : Colors.black,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        DefaultButton(
                          txtColor: isDark ? Colors.white : Colors.black,
                          text: textforElevate!,
                          onPressedFun: forElevatedButton,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
    return (action != null) ? action : DialogAction.cancle;
  }
}
