import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_presence/data/repository/auth_repository.dart';
import 'package:flutter_presence/data/repository/home_repository.dart';
import 'package:flutter_presence/data/services/local/access_token.dart';
import 'package:flutter_presence/di/service_locator.dart';
import 'package:flutter_presence/models/mhs_data.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _homeRepository = getIt.get<HomeRepository>();
  final _authRepository = getIt.get<AuthRepository>();
  AuthBloc() : super(AuthSignOut()) {
    on<SignIn>((event, emit) async {
      if (state is AuthSignOut) {
        final _sharedPref = getIt.get<SharedPref>();
        final token = await _authRepository.login(
            nim: event.nim, password: event.password);

        if (token != null) {
          MhsData user =
              await _homeRepository.mhs(nim: event.nim, access_token: token);
        }
      }
    });
  }
}
