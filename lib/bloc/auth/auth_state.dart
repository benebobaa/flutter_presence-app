// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignOut extends AuthState {}

class AuthSignedIn extends AuthState {

  final MhsData user;
  const AuthSignedIn(
    this.user,
  );

  @override
  List<Object?> get props => [user];
}
