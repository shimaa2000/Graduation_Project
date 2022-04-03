import '../../core/services/api/errors/server_error.dart';
import '../../models/auth_response.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final AuthResponse loginResponse;

  LoginSuccessState(this.loginResponse);
}

class LoginErrorState extends LoginStates {
  final ServerError error;
  LoginErrorState(this.error);
}
