import 'package:graduation_project/core/services/api/errors/server_error.dart';
import 'package:graduation_project/models/products.dart';

abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppChangeBottomNavStates extends AppStates {}

class AppModeState extends AppStates {}

class AppLoadingHomeState extends AppStates {}

class AppSuccessHomeState extends AppStates {
  final Products response;
  AppSuccessHomeState(this.response);
}

class AppErrorHomeState extends AppStates {
  final ServerError error;
  AppErrorHomeState(this.error);
}
