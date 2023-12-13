import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServices {
  static Dio client = Dio();

  ApiServices.init() {
    const int apiTimeoutDuration = 10 * 1000;

    String baseUrl = dotenv.env["API_BASE_URL"] ?? "";

    Map<String, dynamic> headers = {};

    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(milliseconds: apiTimeoutDuration),
    );

    client = Dio(options);

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

    client.interceptors.add(interceptor);
  }

  // Global Api

  static Future<void> createPost() async {
    final serviceRes = client.post("/create");
    log(serviceRes.toString());
  }

  static Future<void> getPost() async {
    final serviceRes = client.get("/get");
    log(serviceRes.toString());
  }

  static Future<void> updatePost() async {
    final serviceRes = client.put("/update");
    log(serviceRes.toString());
  }

  static Future<void> deletePost() async {
    final serviceRes = client.delete("/delete");
    log(serviceRes.toString());
  }
}
