import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_presence/data/dio_client.dart';
import 'package:flutter_presence/data/services/api/constant_api.dart';

class AuthApi {
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  Future<Response> postLogin({
    required String nim,
    required String password,
  }) async {
    FormData data = FormData.fromMap({
      'username': nim,
      'keyword': password,
    });

    try {
      final Response res = await _dioClient.post(
        ConstantApi.authEndpoint,
        data: data,
      );
      return res;
    } on DioError catch (e) {
      // final String errorMsg = DioException.fromDioError(e).toString();
      throw "post login error";
    }
  }
}
