import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/models/user_signup_request.dart';
import 'package:graduation_project/models/user_signup_response.dart';
import 'package:graduation_project/network/cubit/signUpStates.dart';
import 'package:graduation_project/network/remote/dioHelper.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignInitialState());


  static SignUpCubit get(context) => BlocProvider.of(context);

  UserSignUp? SignRequest;
  UserResponse? SignResponse;
  void userSign({
    required String userName,
    required String fullName,
    required String email,
    required String password,
    required String gender,
    required String birthday,
    required String phoneNumber,
    required String address,

  }) {
    emit(SignLoadingState());

    DioHelper.postData(url: SIGN, data: {
      'userName': userName,
      'fullName' : fullName,
      'email': email,
      'password': password,
      'gender': gender,
      'birthday': birthday,
      'phoneNumber': phoneNumber,
      'address': address,

    }).then((value) {
      SignRequest = UserSignUp.fromJson(value.data);
      SignResponse = UserResponse.fromJson(value.data);
      // print(value.data);
      emit(SignSuccessState(SignRequest!, SignResponse!));
    }).catchError((error) {
      print(error.toString());
      emit(SignErrorState(error.toString()));
    });
  }
}
