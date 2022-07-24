import 'package:graduation_project/models/restePassword.dart';

import '../../core/services/api/errors/server_error.dart';
import '../../models/auth_response.dart';

abstract class ResetStates {}

class ResetInitialState extends ResetStates {}

class ResetLoadingState extends ResetStates {}

class ResetSuccessState extends ResetStates {
  final UserMail resetResponse;

  ResetSuccessState(this.resetResponse);
}

class ResetErrorState extends ResetStates {
  final ServerError error;
  ResetErrorState(this.error);
}
class VerifyLoadingState extends ResetStates {}

class VerifySuccessState extends ResetStates {
  final ResetCodes verifyResponse;

  VerifySuccessState(this.verifyResponse);
}

class VerifyErrorState extends ResetStates {
  final ServerError error;
  VerifyErrorState(this.error);
}

class VerifyOnEditingSuccessState extends ResetStates{}

class NewPassLoadingState extends ResetStates {}

class NewPassSuccessState extends ResetStates {
  final NewPass newPassResponse;

  NewPassSuccessState(this.newPassResponse);
}

class NewPassErrorState extends ResetStates {
  final ServerError error;
  NewPassErrorState(this.error);
}