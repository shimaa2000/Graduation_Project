
import 'package:graduation_project/models/products.dart';

import '../../core/services/api/errors/server_error.dart';

abstract class PostProductStates {}

class PostProductInitialState extends PostProductStates {}

class PostProductLoadingState extends PostProductStates {}

class PostProductSuccessState extends PostProductStates {
  final Product response;
  PostProductSuccessState(this.response);

}

class PostProductErrorState extends PostProductStates {
  final ServerError error;
  PostProductErrorState(this.error);
}
