import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_presence/data/repository/auth_repository.dart';
import 'package:flutter_presence/data/repository/home_repository.dart';
import 'package:flutter_presence/data/services/local/access_token.dart';
import 'package:flutter_presence/di/service_locator.dart';
import 'package:flutter_presence/models/mhs_data.dart';
import 'package:flutter_presence/utils/snackbar_message.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _homeRepository = getIt.get<HomeRepository>();
  final _authRepository = getIt.get<AuthRepository>();
  final _storage = getIt.get<SharedPref>();

  AuthBloc() : super(AuthSignOut()) {
    on<SignIn>((event, emit) async {
      if (state is AuthSignOut) {
        final _sharedPref = getIt.get<SharedPref>();
        // emit(AuthLoading());
        _authRepository.login(
          nim: event.nim,
          password: event.password,
          onSuccess: ((msg, token) async {
            await _storage.saveToken(token: token);
            try {
              MhsData data = await _homeRepository.mhs(access_token: token);
              emit(AuthSignedIn(data));
            } catch (e) {
              // emit(AuthSignOut());
              print(e);
              // snackbarMessage(context, e.toString());
            }
          }),
          onError: (msg) {
            print('salah pswrd');

            return;
          },
        );
      }
    });

    on<SignOut>((event, emit) async {
      if (state is AuthSignedIn) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove('nim');
        _storage.deleteToken();
        emit(AuthSignOut());
      }
    });

    on<CheckAuthStatus>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = await _storage.readToken();
      // String? nim = await pref.getString('nim');

      if (token != null) {
        bool tokenValid =
            await _homeRepository.tokenIsValid(access_token: token);

        if (tokenValid) {
          MhsData mhs = await _homeRepository.mhs(access_token: token);

          emit(AuthSignedIn(mhs));
        }
      }
    });
  }
}
