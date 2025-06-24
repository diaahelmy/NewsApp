import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;


  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        // connectTimeout: const Duration(seconds: 10),
        // receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }
  static Future<Response> getData({

    required String url,
  required  Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
