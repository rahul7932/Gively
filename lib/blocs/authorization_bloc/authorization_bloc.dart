import 'dart:async';

import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:Gively/data/models/models.dart';
import 'package:Gively/services/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      case SignOutEvent:
          _authService.signOut();
        break;
    }
  }
}
