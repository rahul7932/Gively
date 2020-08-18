import 'dart:async';

import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:Gively/data/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validators/validators.dart';
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
      yield AuthorizationInvalidEmail();
    else if (isNull(event.password) || event.password == "")
      yield AuthorizationInvalidPasswordState();
    else {
      var user = await _authService.signIn(event.email, event.password);
      if (user == null) {
        yield AuthorizationFailState();
      } else {
        if (!user.emailVerified) {
          yield NotEmailVerifiedState();
        } else {
          // _secureStorageService.saveUserInfo(user);
          yield AuthorizationSuccessState(user);
        }
      }
    }
  }

  Stream<AuthorizationState> _mapSignUpEventToState(SignUpEvent event) async* {
    await _authService.signUp(event.email, event.password);
    yield VerificationEmailSentState();
  }

  Stream<AuthorizationState> _mapCheckStoredAuthDataToState(
      CheckStoredAuthDataEvent event) async* {
    User user = await _authService.checkForExistingSignIn();
    if (user != null) yield AuthorizationSuccessState(user);
  }
}
