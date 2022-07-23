import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/api/dio_client.dart';
import 'package:graduation_project/models/products.dart';
import 'package:graduation_project/models/user_data_model.dart';
import 'package:graduation_project/network/cubit/user_data_states.dart';
import 'package:graduation_project/repository/auth_repository.dart';
import '../../endPoints.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UserDataCubit() : super(UserDataInitialState());

  static UserDataCubit get(context) => BlocProvider.of(context);
  String _userFullName = '';
  String _userAddress = '';
  String? _image;
  List<String> productImages = [];
  List<UserProducts> products=[];
  int length = 0;
  String? size;

  final authRepository = AuthRepository();

  void getUserData() async {
    emit(UserDataLoadingState());
    final response = await authRepository.userDataFun();
    response.fold(
      (error) => emit(UserDataErrorState(error)),
      (response) {
        setUserImage('$BASEURL/${response.image}');
        for (int i = 0; i < response.userProducts!.length; i++){
          products.add(response.userProducts![i]);
        }
        print(products.length);
          for (int i = 0; i < response.userProducts!.length; i++) {
            productImages
                .add('$BASEURL/${response.userProducts![i].images![0]}');
          }
        length = productImages.length;

        setUserAddress(response.address![0]);
        setUserName(response.userName!);
        emit(UserDataSuccessState(response));
      },
    );
  }

  void setUserName(String userName) {
    _userFullName = userName;
  }

  getUserName() {
    return _userFullName;
  }

  void setUserImage(String? imgUrl) {
    _image = imgUrl;
  }

  getUserImage() {
    return _image;
  }

  void setUserAddress(String address) {
    _userAddress = address;
  }

  getUserAddress() {
    return _userAddress;
  }
}
//     .then((value) {
// print('00000000000');
// userModel =UserData.fromJson(value.data) ;
// emit(UserDataSuccessState(userModel!));
// }).catchError((error) {
// print(error.toString());
// emit(UserDataErrorState(error));
// }
