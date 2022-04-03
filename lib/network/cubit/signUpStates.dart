import 'package:graduation_project/core/services/api/errors/server_error.dart';
import 'package:graduation_project/models/auth_response.dart';
import 'package:graduation_project/models/user_signup_request.dart';

abstract class SignUpStates {}

class SignInitialState extends SignUpStates {}

class SignLoadingState extends SignUpStates {}

class SignSuccessState extends SignUpStates {
  final AuthResponse userResponse;

  SignSuccessState(this.userResponse);
}

class SignErrorState extends SignUpStates {
  final ServerError error;
  SignErrorState(this.error);
}
