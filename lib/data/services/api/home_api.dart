import 'package:dio/dio.dart';
import 'package:flutter_presence/data/dio_client.dart';
import 'package:flutter_presence/data/services/api/constant_api.dart';

class HomeApi {
  final DioClient _dioClient;

  HomeApi(this._dioClient);

  Future<Response> getMatkul({
    required String nim,
    required String access_token,
  }) async {
    try {
      final Response res = await _dioClient.get(
        ConstantApi.matkulEndpoint,
        queryParameters: {'nim': nim, 'token': access_token},
      );
      return res;
    } on DioError catch (e) {
      // final String errorMsg = DioException.fromDioError(e).toString();
      throw "nim or token incorrect";
    }
  }
}
