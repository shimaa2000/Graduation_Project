import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  final authRepository = AuthRepository();

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    final response = await authRepository.login({
      'email': email,
      'password': password,
    });

    response.fold(
      (error) => emit(LoginErrorState(error)),
      (authResponse) {
        emit(LoginSuccessState(authResponse));
      },
    );
  }


  // for login screen
  final loginUserController = TextEditingController();
  final loginPassController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

}
