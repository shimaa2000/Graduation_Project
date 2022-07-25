import 'package:graduation_project/models/order_model.dart';

import '../../core/services/api/errors/server_error.dart';

abstract class OrderedStates {}

class OrderedInitialStates extends OrderedStates {}

class OrderedLoadingStates extends OrderedStates{}

class OrderedSuccessStates extends OrderedStates {
  final Orders ordered;
  OrderedSuccessStates(this.ordered);
}
class OrderedErrorStates extends OrderedStates {
  final ServerError error;
  OrderedErrorStates(this.error);
}
