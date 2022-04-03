import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/logger/logger.dart';
import 'package:graduation_project/core/services/api/errors/server_error.dart';

class DioClient {
  static late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://enigmatic-reaches-98451.herokuapp.com/api/',
    ),
  );

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Cookie': token,
    };
    return await _dio.get(url, queryParameters: query);
  }

  static Future<Either<ServerError, Response>> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Cookie': token,
    };
    try {
      final response = await _dio.post(
        url,
        data: data,
      );

      return Right(response);
    } on DioError catch (e) {
      final serverError = ServerError.fromMap(e.response?.data);
      return Left(serverError);
    } catch (e) {
      Logger.logError(e.toString());
      return Left(
        ServerError(
          errors: {"exception": "Something Went Wrong"},
        ),
      );
    }
  }
}
