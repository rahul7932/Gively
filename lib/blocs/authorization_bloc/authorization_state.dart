part of 'authorization_bloc.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();
}

class AuthorizationInitial extends AuthorizationState {
  @override
  List<Object> get props => [];
}

class AuthorizationSuccessState extends AuthorizationState {
  AuthorizationSuccessState(this.user);
  final User user;
  @override
  List<Object> get props => [user];
}

class AuthorizationInvalidPasswordState extends AuthorizationState {
  @override
  List<Object> get props => [];
}

class AuthorizationInvalidEmail extends AuthorizationState {
  @override
  List<Object> get props => [];
}

class AuthorizationFailState extends AuthorizationState {
  @override
  List<Object> get props => [];
}
class AuthorizationPendingState extends AuthorizationState {
  @override
  List<Object> get props => [];
}


