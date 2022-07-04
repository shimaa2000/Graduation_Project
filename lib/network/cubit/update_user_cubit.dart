import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/update_user_states.dart';

import '../../repository/auth_repository.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataStates> {
  UpdateUserDataCubit() : super(UpdateUserDataInitialState());

  final authRepository = AuthRepository();

  static UpdateUserDataCubit get(context) => BlocProvider.of(context);

  void userUpdateUserData( {File? image}) async {
    emit(UpdateUserDataLoadingState());
    final data = FormData();
    data.fields.addAll([
      MapEntry('userName', ''),
      MapEntry('email', ''),
      MapEntry('password', ''),
      MapEntry('fullName', ''),
    ]);
    if (image != null) {
      data.files.add(MapEntry('profile', MultipartFile.fromString(image.path)));
    }
    final response = await authRepository.updateUserData(data);
    response.fold(
      (error) => emit(UpdateUserDataErrorState(error)),
      (authResponse) {
        emit(UpdateUserDataSuccessState(authResponse));
      },
    );
  }
}
