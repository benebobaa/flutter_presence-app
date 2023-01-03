import 'dart:convert';

import 'package:flutter_presence/data/services/api/home_api.dart';
import 'package:flutter_presence/models/matkul_data.dart';
import 'package:flutter_presence/models/mhs_data.dart';

class HomeRepository {
  final HomeApi _homeApi;
  HomeRepository(this._homeApi);

  Future<MhsData> mhs({
    required String nim,
    required String access_token,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _homeApi.getMhs(
        nim: nim,
        access_token: access_token,
      );
      final Map<String, dynamic> parsed = json.decode(res.data);
      final data = MhsData.fromJson(parsed);
      return data;
    } catch (e) {
      print('oalahh langsung ini');
      print(e.toString());
      onError!(e.toString());
      rethrow;
    }
  }
}
