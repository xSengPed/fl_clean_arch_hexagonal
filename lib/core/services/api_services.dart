import 'dart:developer';

import 'package:dio/dio.dart';

class ApiServices {
  static Dio _dioClient = Dio();

  ApiServices.init() {
    const String baseUrl = "";
    const int apiTimeoutDuration = 10 * 1000;

    Map<String, dynamic> headers = {};

    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(milliseconds: apiTimeoutDuration),
    );

    _dioClient = Dio(options);

    Interceptor interceptor = InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    );

    _dioClient.interceptors.add(interceptor);
  }

  static Future<void> createPost() async {
    final serviceRes = _dioClient.post("/create");
    log(serviceRes.toString());
  }

  static Future<void> getPost() async {
    final serviceRes = _dioClient.get("/get");
    log(serviceRes.toString());
  }

  static Future<void> updatePost() async {
    final serviceRes = _dioClient.put("/update");
    log(serviceRes.toString());
  }

  static Future<void> deletePost() async {
    final serviceRes = _dioClient.delete("/delete");
    log(serviceRes.toString());
  }
}
