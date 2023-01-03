import 'dart:convert';
import 'package:flutter_presence/data/services/api/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;
  AuthRepository(this._authApi);

  Future<String> login({
    required String nim,
    required String password,
    void Function(String msg)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _authApi.postLogin(
        nim: nim,
        password: password,
      );
      print(res);
      final data = json.decode(res.data['access_token']);
      print('ini token ngab ${data}');
      return data;
    } catch (e) {
      print(e.toString());
      onError!(e.toString());
      rethrow;
    }
  }
}
