import 'dart:convert';
import 'package:flutter_presence/data/services/api/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi;
  AuthRepository(this._authApi);

  Future<void> login({
    required String nim,
    required String password,
    void Function(String msg, String token)? onSuccess,
    void Function(String msg)? onError,
  }) async {
    try {
      final res = await _authApi.postLogin(
        nim: nim,
        password: password,
      );
      print(res.data);
      final String token = res.data["access_token"];
      print(token);
      onSuccess!('Login Successfully', token);
    } catch (e) {
      print(e.toString());
      onError!(e.toString());
    }
  }
}
