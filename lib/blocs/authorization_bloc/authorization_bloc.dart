import 'dart:async';

import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:Gively/data/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validators/validators.dart';
import 'package:meta/meta.dart';
part 'authorization_event.dart';
part 'authorization_state.dart';

AuthService _authService;

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc(IAuthorizationRepository _authRepository)
      : super(AuthorizationInitial()) {
    _authService = AuthService(_authRepository);
  }
  @override
  Stream<AuthorizationState> mapEventToState(
    AuthorizationEvent event,
  ) async* {
    switch (event.runtimeType) {
      case CheckStoredAuthDataEvent:
        yield* _mapCheckStoredAuthDataToState(event);
        break;
      case SignOutEvent:
        _authService.signOut();
        break;
      case SignInEvent:
        yield* _mapSignInEventToState(event);
        break;
      case SignUpEvent:
        yield* _mapSignUpEventToState(event);
        break;
    }
  }

  Stream<AuthorizationState> _mapSignInEventToState(SignInEvent event) async* {
    yield AuthorizationPendingState();
    if (!isEmail(event.email))
      yield AuthorizationFailState(message: 'This is not a proper email.');
    else if (isNull(event.password) || event.password == "")
      yield AuthorizationFailState(message: 'Please enter a password.');
    else {
      var user = await _authService.signIn(event.email, event.password);
      if (user == null) {
        yield AuthorizationFailState(message:'The information you provided does not match our records.');
      } else {
        if (!user.emailVerified) {
          yield AuthorizationFailState(message: 'Check your inbox to validate your email');
        } else {
          // _secureStorageService.saveUserInfo(user);
          yield AuthorizationSuccessState(user);
        }
      }
    }
  }

  Stream<AuthorizationState> _mapSignUpEventToState(SignUpEvent event) async* {
   String status =  _authService.signUp(event.email, event.password);
   if(status=='success') {
     yield VerificationEmailSentState();
   }
   else {
     yield AuthorizationFailState(message: status);
   }
  }

  Stream<AuthorizationState> _mapCheckStoredAuthDataToState(
      CheckStoredAuthDataEvent event) async* {
    User user = _authService.currentUserStatus();
    if (user != null) yield AuthorizationSuccessState(user);
  }
}
