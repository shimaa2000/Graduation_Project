import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/network/cubit/resetCubit.dart';
import 'package:graduation_project/network/cubit/resetStates.dart';
import 'package:graduation_project/screens/new_password_screeen.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AccountVerification extends StatelessWidget {
  static const routeName = 'account_verification';

  //
  //VerificationCode(
  //                       textStyle:
  //                           TextStyle(fontSize: 20.0, color: Colors.red[900]),
  //                       keyboardType: TextInputType.number,
  //                       underlineColor: Colors.amber,
  //                       length: 6,
  //                       cursorColor: Colors.blue,
  //                       clearAll: Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Text(
  //                           'clear all',
  //                           style: TextStyle(
  //                               fontSize: 14.0,
  //                               decoration: TextDecoration.underline,
  //                               color: Colors.blue[700]),
  //                         ),
  //                       ),
  //                       onCompleted: (String value){
  //                         reset.onCompleting(value);
  //                       },
  //                       onEditing: (bool value){
  //                         reset.onEditing(value, context);
  //                       },
  //                     ),

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCubit, ResetStates>(
      builder: (context, state) {
        var reset = ResetCubit.get(context);
        return SafeArea(
          child: PasswordResetWidget(
              emojiUrl: reset.verifyEmojiUrl,
              inContainer: Form(
                key: reset.verifyFormKey,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Code',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        )),
                    PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      obscuringWidget: const Icon(Icons.security),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "Please fill all fields";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        inactiveFillColor: Colors.white,
                        shape: PinCodeFieldShape.box,
                        selectedFillColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),

                      backgroundColor: Colors.white,
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: reset.errorController,
                      controller: reset.verifyTextEditingController,
                      keyboardType: TextInputType.number,
                      textStyle: TextStyle(color: Colors.black),
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        reset.onCompleting(v);
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        reset.verifyOnChange(value);
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ConditionalBuilderRec(
                          condition: state is! NewPassLoadingState,
                          builder: (context) => DefaultButton(
                              onPressedFun: () {
                                if (reset.verifyFormKey.currentState!
                                    .validate()) {
                                  reset.verifyCode();
                                  Navigator.pushNamed(
                                      context, NewPassword.routeName);
                                }
                              },
                              text: 'Verify'),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              smallText: reset.verifySmallText,
              bigText: reset.verifyBigText,
              fistLineAfterEmoji: reset.verifyFirstLineAfterEmoji,
              secondLine: reset.verifySecondLine),
        );
      },
      listener: (context, state) {},
    );
  }
}
