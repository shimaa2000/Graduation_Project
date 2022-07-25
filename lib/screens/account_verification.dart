import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/network/cubit/resetCubit.dart';
import 'package:graduation_project/network/cubit/resetStates.dart';
import 'package:graduation_project/screens/new_password_screeen.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AccountVerification extends StatelessWidget {
  static const routeName = 'account_verification';

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
                          style: Theme.of(context).textTheme.headline3,
                        )),
                    PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      obscuringWidget:  Icon(
                        Icons.security,
                        color: isDark ? Colors.black : Colors.white,
                      ),
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

                        inactiveFillColor: isDark? Colors.white: Colors.black,
                        shape: PinCodeFieldShape.box,
                        selectedFillColor:isDark? Colors.white: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor:isDark? Colors.white: Colors.black,
                      ),

                      backgroundColor: isDark? Colors.white: Colors.black,
                      cursorColor:isDark? Colors.black: Colors.white,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: reset.errorController,
                      controller: reset.verifyTextEditingController,
                      keyboardType: TextInputType.number,
                      textStyle: TextStyle(color: isDark? Colors.black: Colors.white),
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        reset.onCompleting(v);
                        debugPrint("Completed$v");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        reset.verifyOnChange(value);
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text",);
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
                            txtColor: isDark? Colors.white: Colors.black,
                              onPressedFun: () {
                                  Navigator.pushNamed(
                                      context, NewPassword.routeName);
                              },
                              text: 'Verify'),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
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
