import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/order_model.dart';
import 'package:graduation_project/models/products.dart';
import 'package:graduation_project/network/cubit/orderedStates.dart';
import 'package:graduation_project/repository/auth_repository.dart';

import '../../endPoints.dart';

class OrderedCubit extends Cubit<OrderedStates> {
  OrderedCubit() : super(OrderedInitialStates());

  static OrderedCubit get(context) => BlocProvider.of(context);
  final authRepository = AuthRepository();
  String? _imgUrl;
  int? _totalPrice;
  int? length;
  int _index = 0;
  String? _title;
  //OrderedModel? value;
  List<OrderedModel> products=[];

  void getOrderedData() async {
    emit(OrderedLoadingStates());
    final response = await authRepository.orderedAdsFun();
    response.fold(
      (error) => emit(OrderedErrorStates(error)),
      (response) {
        //value = OrderedModel.fromMap(response.ordered![getIndex()]);
        for (int i = 0; i < response.ordered!.length; i++){
          products.add(response.ordered![i]);
        }
        if(products.length!=0){
          setLength(products.length);
          setTitle(products[getIndex()].product!.title!);
          setImage('$BASEURL/${products[getIndex()].product!.images![0]}');
          setTotalPrice(products[getIndex()].totalPrice!);
        }
        emit(OrderedSuccessStates(response));
      },
    );
  }

  void setImage(String? imgUrl) {
    _imgUrl = imgUrl;
  }

  getImage() {
    return _imgUrl;
  }
  void setTitle(String? title) {
    _title = title;
  }

  getTitle() {
    return _title;
  }

  void setTotalPrice(int total) {
    _totalPrice = total;
  }

  getTotalPrice() {
    return _totalPrice;
  }

  void setIndex(int index) {
    _index = index;
  }

  getIndex() {
    return _index;
  }

  void setLength(int len) {
    length = len;
  }

  getLength() {
    return length;
  }
}
