import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/api/dio_client.dart';
import 'package:graduation_project/models/user_data_model.dart';
import 'package:graduation_project/network/cubit/user_data_states.dart';
import 'package:graduation_project/repository/auth_repository.dart';
import '../../endPoints.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UserDataCubit() : super(UserDataInitialState());


  static UserDataCubit get(context) => BlocProvider.of(context);
  String _userFullName='';
  String _userAddress='';

  final authRepository = AuthRepository();

  void getUserData() async {
    emit(UserDataLoadingState());
    final response = await authRepository.userDataFun();
    response.fold(
      (error) => emit(UserDataErrorState(error)),
      (response) {
        setUserAddress(response.address![0]);
        setUserName(response.fullName!);
        emit(UserDataSuccessState(response));
      },
    );
  }
  void setUserName(String userName){
    _userFullName=userName;
  }
  getUserName() {
    return _userFullName;
  }
  void setUserAddress(String address){
    _userAddress=address;
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
