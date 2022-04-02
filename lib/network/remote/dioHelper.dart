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
    try {
      final response = await dio.post(
        url,
        // queryParameters: query,
        data: data,
      );
      if (response.statusCode! == 200) {
        return response;
      }
      throw response.data ?? '';
    } catch (e) {
      throw e.toString();
    }
  }

}
