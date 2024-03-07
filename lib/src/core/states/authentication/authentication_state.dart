part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  AuthenticationSuccess({required this.data});
  final AuthenticationResponse data;
}

class AuthenticationError extends AuthenticationState {
  AuthenticationError({required this.message});
  final String message;
}
