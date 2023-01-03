// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignIn extends AuthEvent {
  final String nim;
  final String password;

  const SignIn({
    required this.nim,
    required this.password,
  });

  @override
  List<Object?> get props => [nim, password];
}

class SignOut extends AuthEvent {}

class CheckAuthStatus extends AuthEvent {}
