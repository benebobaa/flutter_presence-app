import 'dart:convert';

import 'package:flutter_presence/data/services/api/home_api.dart';
import 'package:flutter_presence/models/matkul_data.dart';
import 'package:flutter_presence/models/mhs_data.dart';

class HomeRepository {
  final HomeApi _homeApi;
  HomeRepository(this._homeApi);

  Future<MhsData> mhs({
    required String access_token,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _homeApi.getMhs(
        access_token: access_token,
      );
      MhsData data = MhsData.fromJson(res.data);
      print('Check parsing data ${data.mhs!.nama}');
      return data;
    } catch (e) {
      print('oalahh langsung ini');
      print(e.toString());
      // onError!(e.toString());
      rethrow;
    }
  }

  Future<bool> tokenIsValid({
    required String access_token,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _homeApi.checkToken(
        access_token: access_token,
      );
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('oalahh langsung ini');
      print(e.toString());
      onError!(e.toString());
      rethrow;
    }
  }
}
