import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/models/user_login_request.dart';
import 'package:graduation_project/models/user_login_response.dart';
import 'package:graduation_project/network/cubit/loginStates.dart';
import 'package:graduation_project/network/remote/dioHelper.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginRequest? loginRequest ;
  LoginResponse? loginResponse;
  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());

    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
     loginRequest = LoginRequest.fromJson(value.data);
     loginResponse = LoginResponse.fromJson(value.data);
   //   print(value.data);
      emit(LoginSuccessState(loginRequest!,loginResponse!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
