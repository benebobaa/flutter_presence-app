import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_presence/data/services/api/constant_api.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = ConstantApi.baseUrl
      ..options.connectTimeout = ConstantApi.connectionTimeout
      ..options.receiveTimeout = ConstantApi.receiveTimeout
      ..options.responseType = ResponseType.json
      ..options.headers = {HttpHeaders.userAgentHeader: ConstantApi.userAgent}
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
  }

  /// GET
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
