
import 'package:graduation_project/models/user_login_request.dart';
import 'package:graduation_project/models/user_login_response.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final LoginRequest loginRequest;
  final LoginResponse loginResponse;

  LoginSuccessState(this.loginRequest , this.loginResponse);
}

class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}