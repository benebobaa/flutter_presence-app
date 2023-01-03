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

class AuthLoaded extends AuthState {
  final MhsData user;
  const AuthLoaded(this.user);

  @override
  List<Object?> get props => [user];
}
