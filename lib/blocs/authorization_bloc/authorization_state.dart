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

class AuthorizationFailedState extends AuthorizationState {
  @override
  List<Object> get props => [];
}

class AuthorizationPendingState extends AuthorizationState {
  @override
  List<Object> get props => [];
}


