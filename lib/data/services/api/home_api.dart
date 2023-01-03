import 'package:dio/dio.dart';
import 'package:flutter_presence/data/dio_client.dart';
import 'package:flutter_presence/data/services/api/constant_api.dart';

class HomeApi {
  final DioClient _dioClient;

  HomeApi(this._dioClient);

  Future<Response> getMhs({
    required String access_token,
  }) async {
    Options options = Options(headers: {'Authorization': access_token});
    try {
      final Response res = await _dioClient.get(
        ConstantApi.matkulEndpoint,
        options: options,
      );
      return res;
    } on DioError catch (e) {
      // final String errorMsg = DioException.fromDioError(e).toString();
      throw "get mhs error";
    }
  }

  Future<Response> checkToken({
    required String access_token,
  }) async {
    Options options = Options(headers: {'Authorization': access_token});
    try {
      final Response res = await _dioClient.get(
        ConstantApi.matkulEndpoint,
        options: options,
      );
      return res;
    } on DioError catch (e) {
      // final String errorMsg = DioException.fromDioError(e).toString();
      throw "check token error";
    }
  }
}
