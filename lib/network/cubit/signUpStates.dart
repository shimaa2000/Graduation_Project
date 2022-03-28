
import 'package:graduation_project/models/user_signup_request.dart';
import 'package:graduation_project/models/user_signup_response.dart';

abstract class SignUpStates{}

class SignInitialState extends SignUpStates{}

class SignLoadingState extends SignUpStates{}

class SignSuccessState extends SignUpStates{
  final UserSignUp userRequest;
  final UserResponse userResponse;

  SignSuccessState(this.userRequest , this.userResponse);
}

class SignErrorState extends SignUpStates{
  final String error;
  SignErrorState(this.error);
}