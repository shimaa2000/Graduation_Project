import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/models/auth_response.dart';
import 'package:graduation_project/network/cubit/signUpStates.dart';
import 'package:graduation_project/core/services/api/dio_client.dart';
import 'package:graduation_project/repository/auth_repository.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  final authRepository = AuthRepository();

  void userSign({
    required String userName,
    required String fullName,
    required String email,
    required String password,
    required String gender,
    required String birthday,
    required String phoneNumber,
    required String address,
  }) async {
    emit(SignLoadingState());

    final response = await authRepository.signUp({
      'userName': userName,
      'fullName': fullName,
      'email': email,
      'password': password,
      'gender': gender,
      'birthday': birthday,
      'phoneNumber': phoneNumber,
      'address': address,
    });

    response.fold(
      (error) => emit(SignErrorState(error)),
      (authResponse) {
        emit(SignSuccessState(authResponse));
      },
    );
  }
}
