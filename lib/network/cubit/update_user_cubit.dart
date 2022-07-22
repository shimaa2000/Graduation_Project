import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/update_user_states.dart';

import '../../repository/auth_repository.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataStates> {
  UpdateUserDataCubit() : super(UpdateUserDataInitialState());

  final authRepository = AuthRepository();

  static UpdateUserDataCubit get(context) => BlocProvider.of(context);

  var editProfileUserNameController = TextEditingController();
  var editProfileEmailController = TextEditingController();
  var editProfileAddressController = TextEditingController();

  void updateUserData() async {
    emit(UpdateUserDataLoadingState());

    final response = await authRepository.updateUserData({
      'userName': editProfileUserNameController.text,
      'address': editProfileAddressController.text,
      'email': editProfileEmailController.text,
    });

    response.fold(
      (error) => emit(UpdateUserDataErrorState(error)),
      (response) {
        emit(UpdateUserDataSuccessState(response));
      },
    );
  }

  Future userUpdateUserImage({File? image}) async {
    emit(UpdateUserDataLoadingState());
    final data = FormData();
    if (image != null) {
      final multipartImage = await MultipartFile.fromFile(image.path);
      data.files.add(
        MapEntry('profile', multipartImage),
      );
    }
    final response = await authRepository.updateUserImage(data);
    response.fold(
      (error) => emit(UpdateUserDataErrorState(error)),
      (authResponse) {
        emit(UpdateUserDataSuccessState(authResponse));
      },
    );
  }
}
