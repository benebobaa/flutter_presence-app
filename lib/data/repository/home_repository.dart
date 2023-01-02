import 'dart:convert';

import 'package:flutter_presence/data/services/api/home_api.dart';
import 'package:flutter_presence/models/matkul_data.dart';


class HomeRepository {
  final HomeApi _homeApi;
  HomeRepository(this._homeApi);

  Future<List<MatkulData>> matkul({
    required String nim,
    required String access_token,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _homeApi.getMatkul(
        nim: nim,
        access_token: access_token,
      );

      final data = ((res.data ?? []) as List)
          .map((e) => MatkulData.fromJson(e))
          .toList();
      return data;
    } catch (e) {
      print('oalahh langsung ini');
      print(e.toString());
      onError!(e.toString());
      rethrow;
    }
  }

  Future<List<MatkulData>> matkul2({
    required String nim,
    required String access_token,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    final res = await _homeApi.getMatkul(
      nim: nim,
      access_token: access_token,
    );
    print('status code ${res.statusCode}');
    if (res.statusCode == 500) {
      final res2 = await _homeApi.getMatkul(
        nim: nim,
        access_token: access_token,
      );
      final data2 = ((res2.data ?? []) as List)
          .map((e) => MatkulData.fromJson(e))
          .toList();
      print('masih eror 500');
      return data2;
    } else {
      final data = ((res.data ?? []) as List)
          .map((e) => MatkulData.fromJson(e))
          .toList();
      return data;
    }
  }
}
