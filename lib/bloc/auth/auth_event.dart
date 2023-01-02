part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  List<Object?> get props => [];
}

class OnAuthEventCalled extends AuthEvent {}
