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

class AuthorizationFailState extends AuthorizationState {
  AuthorizationFailState({this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
class AuthorizationPendingState extends AuthorizationState {
  @override
  List<Object> get props => [];
}

class VerificationEmailSentState extends AuthorizationState {
  @override
  List<Object> get props => [];
}

class NotEmailVerifiedState extends AuthorizationState{
  @override
  List<Object> get props => [];
}

