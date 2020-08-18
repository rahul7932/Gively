part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();
}

class SignOutEvent extends AuthorizationEvent{
  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthorizationEvent{
  RegisterEvent({this.email, this.password});
  final String email;
  final String password;
  @override
  List<Object> get props => [email, password];
}

class SignInEvent extends AuthorizationEvent{
  SignInEvent({this.email, this.password});
  final String email;
  final String password;
  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthorizationEvent{
  SignUpEvent({this.email, this.password});
  final String email;
  final String password;
  @override
  List<Object> get props => [email, password];
}