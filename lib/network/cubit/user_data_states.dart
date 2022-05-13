import 'package:graduation_project/models/user_data_model.dart';

import '../../core/services/api/errors/server_error.dart';


abstract class UserDataStates {}

class UserDataInitialState extends UserDataStates {}

class UserDataLoadingState extends UserDataStates {}

class UserDataSuccessState extends UserDataStates {
  final UserData response;
  UserDataSuccessState(this.response);

}

class UserDataErrorState extends UserDataStates {
  final ServerError error;
  UserDataErrorState(this.error);
}
