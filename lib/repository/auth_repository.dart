import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/models/products.dart';
import '../core/services/api/dio_client.dart';
import '../core/services/api/errors/server_error.dart';
import '../models/auth_response.dart';
import '../models/user_data_model.dart';
import '../endPoints.dart';

class AuthRepository {
  static String _token = '';
  static String? _userId;
  //Login
  Future<Either<ServerError, AuthResponse>> login(Map<String, dynamic> loginRequest) async {
    final response = await DioClient.postData(
      url: LOGIN,
      data: loginRequest,
    );

    return response.fold(
      (error) => Left(error),
      (body) {
        final AuthResponse authResponse = AuthResponse.fromMap(body.data);
        _token = authResponse.token!;
        TOKEN=_token;
        _userId = authResponse.userId;
        print(_userId);
        return Right(authResponse);
      },
    );
  }

  //Update User Info
  Future<Either<ServerError, UserData>> updateUserData(FormData data) async {
    final response = await DioClient.putFormData(
      url: "$USERDATA$_userId",
      data: data,
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
  Future<Either<ServerError, AuthResponse>> signUp(Map<String, dynamic> signUpRequest) async {
    final response = await DioClient.postData(
      url: SIGN,
      data: signUpRequest,
    );

    return response.fold(
      (error) => Left(error),
      (body) => Right(AuthResponse.fromMap(body.data)),
    );
  }
  Future<Either<ServerError, Products>> homeDataFun() async {
    final response = await DioClient.getData(
      url: HOME,
      token: _token,
    );
    return response.fold((error) => Left(error),
          (body) => Right(Products.fromList(body.data)),);
  }
}
