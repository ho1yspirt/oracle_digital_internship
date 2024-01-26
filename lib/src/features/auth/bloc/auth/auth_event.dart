part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignupEvent extends AuthEvent {
  const SignupEvent(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SignupConfirmEvent extends AuthEvent {
  const SignupConfirmEvent(this.nickname);

  final String nickname;

  @override
  List<Object> get props => [nickname];
}

class GetAuthStatusEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
