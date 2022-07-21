import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/models/products.dart';
import '../core/services/api/dio_client.dart';
import '../core/services/api/errors/server_error.dart';
import '../models/auth_response.dart';
import '../models/restePassword.dart';
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
        TOKEN = _token;
        _userId = authResponse.userId;
        print(_userId);
        return Right(authResponse);
      },
    );
  }
  //edit profile
  Future<Either<ServerError, UserData>> updateUserData(Map<String, dynamic> editProfile) async {
    final response = await DioClient.putData(
      url: "$USERDATA${CashHelper.getData(key: 'id')}",
      data: editProfile,
      token: CashHelper.getData(key: 'token'),
    );

    return response.fold(
          (error) => Left(error),
          (body) {
        return Right(UserData.fromMap(body.data));
      },
    );
  }


  //mail reset password
  Future<Either<ServerError, UserMail>> reset(Map<String, dynamic> resetPass) async {
    final response = await DioClient.postData(
      url: RESET,
      data: resetPass,
    );

    return response.fold(
          (error) => Left(error),
          (body) {
        final UserMail userMail = UserMail.fromJson(body.data);
        return Right(userMail);
      },
    );
  }


// verify code
  Future<Either<ServerError, ResetCodes>> verify(Map<String, dynamic> verifyCode) async {
    final response = await DioClient.postData(
      url: VERIFY,
      data: verifyCode,
    );

    return response.fold(
          (error) => Left(error),
          (body) {
        final ResetCodes resetCode = ResetCodes.fromJson(body.data);
        return Right(resetCode);
      },
    );
  }
// for new password
  Future<Either<ServerError, NewPass>> newPass(Map<String, dynamic> newPass) async {
    final response = await DioClient.postData(
      url: NEWPASS,
      data: newPass,
    );

    return response.fold(
          (error) => Left(error),
          (body) {
        final NewPass newPass = NewPass.fromJson(body.data);
        return Right(newPass);
      },
    );
  }
  //Update User Image
  Future<Either<ServerError, UserData>> updateUserImage(FormData data) async {
    final response = await DioClient.putFormData(
      url: "$USERDATA${CashHelper.getData(key: 'id')}",
      data: data,
      token: CashHelper.getData(key: 'token'),
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
      url: "$USERDATA${CashHelper.getData(key: 'id')}",
      token: CashHelper.getData(key: 'token'),
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
      token: CashHelper.getData(key: 'token'),
    );
    return response.fold(
      (error) => Left(error),
      (body) => Right(Products.fromList(body.data)),
    );
  }
}
