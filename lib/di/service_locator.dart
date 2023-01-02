import 'package:dio/dio.dart';
import 'package:flutter_presence/data/dio_client.dart';
import 'package:flutter_presence/data/repository/auth_repository.dart';
import 'package:flutter_presence/data/repository/home_repository.dart';
import 'package:flutter_presence/data/services/api/auth_api.dart';
import 'package:flutter_presence/data/services/api/home_api.dart';
import 'package:flutter_presence/data/services/local/access_token.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  /// Networking
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  /// Networking API and Repository
  getIt.registerSingleton(AuthApi(getIt<DioClient>()));
  getIt.registerSingleton(AuthRepository(getIt<AuthApi>()));
  getIt.registerSingleton(HomeApi(getIt<DioClient>()));
  getIt.registerSingleton(HomeRepository(getIt<HomeApi>()));

  getIt.registerSingleton(SharedPref());
}
