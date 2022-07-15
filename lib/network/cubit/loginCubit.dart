import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  final authRepository = AuthRepository();

  static LoginCubit get(context) => BlocProvider.of(context);

  // for login screen
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  void userLogin() async {
    emit(LoginLoadingState());
    final response = await authRepository.login({
      'email': emailController.text,
      'password': passController.text,
    });

    response.fold(
      (error) => emit(LoginErrorState(error)),
      (authResponse) {
        emit(LoginSuccessState(authResponse));
      },
    );
  }
}
