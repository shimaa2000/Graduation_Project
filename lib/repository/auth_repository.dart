import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/services/api/dio_client.dart';
import 'package:graduation_project/core/services/api/errors/server_error.dart';
import 'package:graduation_project/models/auth_response.dart';
import 'package:graduation_project/models/user_data_model.dart';

import '../endPoints.dart';

class AuthRepository {
  static String _token = '';
  static String? _userId;
  //Login
  Future<Either<ServerError, AuthResponse>> login(
      Map<String, dynamic> loginRequest) async {
    final response = await DioClient.postData(
      url: LOGIN,
      data: loginRequest,
    );

    return response.fold(
      (error) => Left(error),
      (body) {
        final AuthResponse authResponse=AuthResponse.fromMap(body.data);
        _token=authResponse.token!;
        _userId=authResponse.userId;
        print(_userId);
        return Right(authResponse);
      },
    );
  }

  //Update User Info
  Future<Either<ServerError, UserData>> updateUserData(
      Map<String, dynamic> updateRequest) async {
    final response = await DioClient.putData(
      url: "$USERDATA$_userId",
      data: updateRequest,
      token: _token,
    );

    return response.fold(
      (error) => Left(error),
      (body) {
        return Right(UserData.fromMap(body.data));
      },
    );
  }

  //User Data
  Future<Either<ServerError, UserData>> userDataFun() async {
    final response = await DioClient.getData(
      url: "$USERDATA$_userId",
      token: _token,
    );
    return response.fold(
      (error) => Left(error),
      (body) => Right(UserData.fromMap(body.data)),
    );
  }

  //SignUP
  Future<Either<ServerError, AuthResponse>> signUp(
      Map<String, dynamic> signUpRequest) async {
    final response = await DioClient.postData(
      url: SIGN,
      data: signUpRequest,
    );

    return response.fold(
      (error) => Left(error),
      (body) => Right(AuthResponse.fromMap(body.data)),
    );
  }
}
