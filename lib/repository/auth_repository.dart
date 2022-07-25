import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/models/details_model.dart';
import 'package:graduation_project/models/editPostModel.dart';
import 'package:graduation_project/models/order_model.dart';
import 'package:graduation_project/models/products.dart';
import '../core/services/api/dio_client.dart';
import '../core/services/api/errors/server_error.dart';
import '../models/auth_response.dart';
import '../models/favouriteModel.dart';
import '../models/restePassword.dart';
import '../models/user_data_model.dart';
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
  Future<Either<ServerError, UserData>> updateUserData(
      Map<String, dynamic> editProfile) async {
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

//edit post
  Future<Either<ServerError, EditPost>> updatePostData(
      Map<String, dynamic> editPost, String id) async {
    final response = await DioClient.putData(
      url: "$PRODUCT/$id",
      data: editPost,
      token: CashHelper.getData(key: 'token'),
    );

    return response.fold(
      (error) => Left(error),
      (body) {
        return Right(EditPost.fromMap(body.data));
      },
    );
  }

  //mail reset password
  Future<Either<ServerError, UserMail>> reset(
      Map<String, dynamic> resetPass) async {
    final response = await DioClient.postData(
      url: RESET,
      data: resetPass,
      token: CashHelper.getData(key: 'token'),
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
  Future<Either<ServerError, ResetCodes>> verify(
      Map<String, dynamic> verifyCode) async {
    final response = await DioClient.postData(
      url: VERIFY,
      data: verifyCode,
      token: CashHelper.getData(key: 'token'),
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
  Future<Either<ServerError, NewPass>> newPass(
      Map<String, dynamic> newPass) async {
    final response = await DioClient.postData(
      url: NEWPASS,
      data: newPass,
      token: CashHelper.getData(key: 'token'),
    );

    return response.fold(
      (error) => Left(error),
      (body) {
        return Right(NewPass.fromMap(body.data));
      },
    );
  }

  // for change password
  Future<Either<ServerError, NewPass>> changePass(
      Map<String, dynamic> newPass) async {
    final response = await DioClient.postData(
      url: CHANGEPASS,
      data: newPass,
      token: CashHelper.getData(key: 'token'),
    );

    return response.fold(
      (error) => Left(error),
      (body) {
        return Right(NewPass.fromMap(body.data));
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

  //post product
  Future<Either<ServerError, Product>> postProduct(FormData data) async {
    final response = await DioClient.postFormData(
      url: "$PRODUCT",
      data: data,
      token: CashHelper.getData(key: 'token'),
    );

    return response.fold(
      (error) => Left(error),
      (body) {
        return Right(Product.fromMap(body.data));
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

  //for favourite get
  Future<Either<ServerError, Favourite>> favItemsFun() async {
    final response = await DioClient.getData(
      url: FAV,
      token: CashHelper.getData(key: 'token'),
    );
    return response.fold(
      (error) => Left(error),
      (body) => Right(Favourite.fromMap(body.data)),
    );
  }

  Future<Either<ServerError, Orders>> orderedAdsFun() async {
    final response = await DioClient.getData(
      url: ORDEREDADS,
      token: CashHelper.getData(key: 'token'),
    );
    return response.fold(
      (error) => Left(error),
      (body) => Right(Orders.fromList(body.data)),
    );
  }

  //for favourite post
  Future<Either<ServerError, Favourite>> addFav(
    String id) async {
    final response = await DioClient.postData(
      url: "$FAV/$id",
      token: CashHelper.getData(key: 'token'),
    );

    return response.fold(
      (error) => Left(error),
      (body) => Right(Favourite.fromMap(body.data)),
    );
  }

  Future<Either<ServerError, Products>> homeDataFun() async {
    final response = await DioClient.getData(
      url: PRODUCT,
      token: CashHelper.getData(key: 'token'),
    );
    return response.fold(
      (error) => Left(error),
      (body) => Right(Products.fromList(body.data)),
    );
  }

  Future<Either<ServerError, ProductDetails>> detailsFun(
    String id,
  ) async {
    final response = await DioClient.getData(
      url: '$PRODUCT/$id',
      token: CashHelper.getData(key: 'token'),
    );
    return response.fold(
      (error) => Left(error),
      (body) => Right(ProductDetails.fromMap(body.data)),
    );
  }
}
