import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/update_user_states.dart';

import '../../repository/auth_repository.dart';


class UpdateUserDataCubit extends Cubit<UpdateUserDataStates> {
  UpdateUserDataCubit() : super(UpdateUserDataInitialState());

  final authRepository = AuthRepository();

  static UpdateUserDataCubit get(context) => BlocProvider.of(context);

  void userUpdateUserData({required String email, required String password}) async {
    emit(UpdateUserDataLoadingState());
    final response = await authRepository.updateUserData({
      'email': email,
      'password': password,
    });
    response.fold(
          (error) => emit(UpdateUserDataErrorState(error)),
          (authResponse) {
        emit(UpdateUserDataSuccessState(authResponse));
      },
    );
  }
}
