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

  static Future<Either<ServerError, Response>> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    try {
      final response = await _dio.patch(
        url,
        data: data,
        options: Options(followRedirects: false, validateStatus: (status) {return status! < 500;}),
      );
      return Right(response);
    } on DioError catch (e) {
      final serverError = ServerError.fromMap(
        e.response?.data,
      );
      print(e.toString());
      return Left(serverError);
    } catch (e) {
      Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> postFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'token': token,
    };
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      return Right(response);
    } on DioError catch (e) {
      if (e.response!.statusCode! > 500) {
        return Left(ServerError(errors: ['Something went wrong']));
      }
      if (e.response?.data is String) {
        return Left(ServerError(errors: [e.response?.data ?? '']));
      }
      final serverError = ServerError.fromMap(
        e.response?.data,
      );
      print(e.toString());
      return Left(serverError);
    } catch (e) {
      Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> putFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'token': token,
    };
    try {
      final response = await _dio.patch(
        url,
        data: data,
      );
      return Right(response);
    } on DioError catch (e) {
      if (e.response!.statusCode! > 500) {
        return Left(ServerError(errors: ['Something went wrong']));
      }
      if (e.response?.data is String) {
        return Left(ServerError(errors: [e.response?.data ?? '']));
      }
      final serverError = ServerError.fromMap(
        e.response?.data,
      );
      print(e.toString());
      return Left(serverError);
    } catch (e) {
      Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    try {
      final response = await _dio.get(url, queryParameters: query);
      return Right(response);
    } on DioError catch (e) {
      ServerError serverError;
      if (e.response?.data is Map) {
        serverError = ServerError.fromMap(
          e.response?.data,
        );
      } else {
        serverError = ServerError(errors: [e.response?.data ?? '']);
      }
      print(e.toString());
      return Left(serverError);
    } catch (e) {
      Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }

  static Future<Either<ServerError, Response>> postData({
    required String url,
     Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
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
      Logging.logError(e.toString());
      return Left(
        ServerError(
          errors: ["Something Went Wrong"],
        ),
      );
    }
  }
}
