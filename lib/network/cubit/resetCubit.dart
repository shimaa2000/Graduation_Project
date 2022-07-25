import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/resetStates.dart';
import 'package:graduation_project/repository/auth_repository.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetCubit extends Cubit<ResetStates> {
  ResetCubit() : super(ResetInitialState());

  final authRepository = AuthRepository();

  static ResetCubit get(context) => BlocProvider.of(context);

  // for reset password screen

  final passController = TextEditingController();
  final passConfirmController = TextEditingController();
  final resetFormKey = GlobalKey<FormState>();
  final newPassFormKey = GlobalKey<FormState>();

// mail entry
  void resetPass() async {
    emit(ResetLoadingState());
    final response = await authRepository.reset({
      'email': resetUserController.text,
    });

    response.fold(
      (error) {
        emit(ResetErrorState(error));
        print('error');
      },
      (response) {
        emit(ResetSuccessState(response));
        print('done');
      },
    );
  }


//setting new pass
  void setNewPass(String newPass) async {
    emit(NewPassLoadingState());
    final response = await authRepository.newPass({
      'newPassword': newPass,
    });

    response.fold(
      (error) {
        emit(NewPassErrorState(error));
        print(error);
      },
      (response) {
        emit(NewPassSuccessState(response));
      },
    );
  }

  //setting new pass
  void changePass(String current, String newPass) async {
    emit(NewPassLoadingState());
    final response = await authRepository.changePass({
      "oldPassword": current,
      'newPassword': newPass,
    });

    response.fold(
      (error) {
        emit(NewPassErrorState(error));
      },
      (response) {
        emit(NewPassSuccessState(response));
      },
    );
  }

  // for reset pass
  final resetUserController = TextEditingController();

  String resetEmojiUrl = 'images/sad.png';
  String resetSmallText = 'Forget';
  String resetBigText = 'Password?';
  String resetFirstLineAfterEmoji =
      'Enter your email associated with this account ';
  String resetSecondLine = 'for password recovery!';

// for new pass
  String passEmojiUrl = '';
  String passSmallText = 'Reset';
  String passBigText = 'Password';
  String passFistLineAfterEmoji = 'You can have a new password';
  String passSecondLine = 'for your account now!';

  //for verification
  bool verifyOnEditing = true;
  final verifyFormKey = GlobalKey<FormState>();
  String? verifyCodeVar;
  String verifyEmojiUrl = 'images/smile.png';
  String verifySmallText = 'Account';
  String verifyBigText = 'Verification';
  String verifyFirstLineAfterEmoji = 'Enter the verification code we just ';
  String verifySecondLine = 'send you on your email!';
  TextEditingController verifyTextEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();

  Future<void> onCompleting(String value) async {
    emit(VerifyLoadingState());
    verifyCodeVar = value;
    print(verifyCodeVar);
    final response = await authRepository.verify({
      'resetCode': verifyCodeVar,
    });

    response.fold(
      (error) {
        emit(VerifyErrorState(error));
        throw (error);
      },
      (authResponse) {
        emit(VerifySuccessState(authResponse));
        print('done');
      },
    );
  }

  void verifyOnChange(String v) {
    verifyCodeVar = v;
  }

  void onEditing(bool value, BuildContext context) {
    verifyOnEditing = value;

    if (!verifyOnEditing) FocusScope.of(context).unfocus();
    emit(VerifyOnEditingSuccessState());
  }
}
