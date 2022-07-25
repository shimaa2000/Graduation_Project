import 'package:graduation_project/core/services/api/errors/server_error.dart';
import 'package:graduation_project/models/editPostModel.dart';
import 'package:graduation_project/models/products.dart';

import '../../models/details_model.dart';

abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppChangeBottomNavStates extends AppStates {}

class AppModeState extends AppStates {}

class AppChangeLanguageState extends AppStates {}

class AppLoadingHomeState extends AppStates {}

class AppSuccessHomeState extends AppStates {
  final Products response;
  AppSuccessHomeState(this.response);
}
class SuccessHomeState extends AppStates {
  final EditPost responses;
  SuccessHomeState(this.responses);
}
class DetailsSuccessState extends AppStates {
  final ProductDetails response;
  DetailsSuccessState(this.response);
}

class AppErrorHomeState extends AppStates {
  final ServerError error;
  AppErrorHomeState(this.error);
}
