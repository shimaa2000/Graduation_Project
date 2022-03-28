import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://enigmatic-reaches-98451.herokuapp.com/api/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
     Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Cookie': token,
    };
    return await dio.get(url, queryParameters: query);

  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
   Map<String, dynamic>? query,
   String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Cookie': token,
    };

    return dio.post(
      url,
     // queryParameters: query,
      data: data,
    );
  }

}
