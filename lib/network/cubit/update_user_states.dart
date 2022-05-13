import 'package:graduation_project/models/user_data_model.dart';

import '../../core/services/api/errors/server_error.dart';


abstract class UpdateUserDataStates {}

class UpdateUserDataInitialState extends UpdateUserDataStates {}

class UpdateUserDataLoadingState extends UpdateUserDataStates {}

class UpdateUserDataSuccessState extends UpdateUserDataStates {
  final UserData response;
  UpdateUserDataSuccessState(this.response);

}

class UpdateUserDataErrorState extends UpdateUserDataStates {
  final ServerError error;
  UpdateUserDataErrorState(this.error);
}
