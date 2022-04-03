import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/services/api/dio_client.dart';
import 'package:graduation_project/core/services/api/errors/server_error.dart';
import 'package:graduation_project/models/auth_response.dart';

import '../endPoints.dart';

class AuthRepository {
  Future<Either<ServerError, AuthResponse>> login(Map<String, dynamic> loginRequest) async {
    final response = await DioClient.postData(
      url: LOGIN,
      data: loginRequest,
    );

    return response.fold(
      (error) => Left(error),
      (body) => Right(AuthResponse.fromMap(body.data)),
    );
  }
}
