import 'package:graduation_project/models/favouriteModel.dart';

import '../../core/services/api/errors/server_error.dart';

abstract class FavStates{}
class AppInitialState extends FavStates{}
class FavLoadingState extends FavStates{}
class AppSuccessState extends FavStates{
  final Favourite response;
  AppSuccessState(this.response);
}
class AppErrorState extends FavStates{
  final ServerError error;
  AppErrorState(this.error);
}