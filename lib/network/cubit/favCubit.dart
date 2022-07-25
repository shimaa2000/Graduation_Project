import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/models/favouriteModel.dart';
import 'package:graduation_project/network/cubit/favStates.dart';
import 'package:graduation_project/repository/auth_repository.dart';
import 'package:graduation_project/screens/homeScreen.dart';

class FavCubit extends Cubit<FavStates> {
  FavCubit() : super(AppInitialState());

  static FavCubit get(context) => BlocProvider.of(context);

  int _index = 0;
  int _length = 0;
  String _title = '';
  String _price = '';
  String _size = '';
  String _userName = '';
  String _image = '';
  FavouriteItems? value;
  final authRepository = AuthRepository();

  //get
  void getFavouriteList() async {
    emit(FavLoadingState());
    final response = await authRepository.favItemsFun();
    response.fold(
      (error) => emit(AppErrorState(error)),
      (response) {
        if (response.favourite!.length != 0) {
          value = FavouriteItems.fromMap(response.favourite![getIndex()]);
          setLength(response.favourite!.length);
          setTitle(value!.title);
          setPrice(value!.price);
          setImage('$BASEURL/${value!.images![0]}');
          setSize(value!.size!.name);
          setUserName(value!.user!.userName);
        }
        emit(AppSuccessState(response));
      },
    );
  }

  void setTitle(String title) {
    _title = title;
  }

  getTitle() {
    return _title;
  }

  void setPrice(String price) {
    _price = price;
  }

  getPrice() {
    return _price;
  }

  void setSize(String size) {
    _size = size;
  }

  getSize() {
    return _size;
  }

  void setUserName(String userName) {
    _userName = userName;
  }

  getUserName() {
    return _userName;
  }

  void setImage(String image) {
    _image = image;
  }

  getImage() {
    return _image;
  }

  void setLength(int length) {
    _length = length;
  }

  getLength() {
    return _length;
  }

  void setIndex(int index) {
    _index = index;
  }

  getIndex() {
    return _index;
  }

  void setFav(String? productId) async {
    emit(FavLoadingState());
    final response = await authRepository.addFav(productId!);
    response.fold((error) => emit(AppErrorState(error)),
    (authResponse) {
      emit(AppSuccessState(authResponse));
    });
  }
}
