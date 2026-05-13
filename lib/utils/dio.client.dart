import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late final Dio _dio;
  // final token = PrefService.getString(PrefeKey.token);
  final token = "";
  DioClient() {
    _dio = Dio(
      BaseOptions(
        validateStatus: (status) {
          return status != null &&
              status < 500; // Accept 400, 401, etc. as valid
        },
      ),
    );

    _dio
      ..options.baseUrl = "https://efatha.astrokalyanapp.com/api/auth"
      ..options.headers = {
        HttpHeaders.authorizationHeader: '${token}',
        // HttpHeaders.acceptHeader: "application/json",
      }
      // ..options.responseType = ResponseType.json
      ..interceptors.add(
        RetryInterceptor(
          dio: _dio,

          logPrint: print,
          retries: 3,
          retryDelays: const [
            Duration(seconds: 2),
            Duration(seconds: 4),
            Duration(seconds: 6),
          ],
        ),
      )
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,

          responseBody: true,

          maxWidth: 90,
          logPrint: (object) {
            print('\x1B[33m$object\x1B[0m');
          },
        ),
      )
      // ..interceptors.add(
      //   InterceptorsWrapper(
      //     onResponse: (response, handler) {
      //       if (response.statusCode == 401) {
      //         _handleUnauthorized();
      //       }
      //       handler.next(response);
      //     },
      //     onError: (DioException error, ErrorInterceptorHandler handler) {
      //       final path = error.requestOptions.path;
      //       final isLoginRequest = path.contains(
      //         'user/login',
      //       ); // 👈 adjust to your login endpoint
      //       if (error.response?.statusCode == 401 && !isLoginRequest) {
      //         _handleUnauthorized();
      //       }
      //       handler.next(error);
      //     },
      //   ),
      // )
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 30);
  }
  // void _handleUnauthorized() async {
  //   Preference.clear();
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('auth_token');
  //   await prefs.remove('user_id');
  //   await prefs.remove('user_name');
  //   await prefs.remove('user_mobile');
  //   await prefs.remove('user_type');
  //   //  Helper.logOut();
  //   Get.offAll(LoginScreen());

  //   AppToast.success("account login on another device ");
  // }

  /// * GET
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        data: data,
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * POST
  Future<Response<dynamic>> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      log(response.data.toString());
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * PUT
  Future<Response<dynamic>> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * PATCH
  Future<Response<dynamic>> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  /// * DELETE
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException {
      rethrow;
    }
  }
}
