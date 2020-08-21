import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final IAuthorizationRepository _authRepository;

  AuthService(this._authRepository);

  Future<User> signIn(String email, String password) async {
    try {
      User user =  await _authRepository.signIn(email, password);
      if(user != null){
      }
      return user;
    } catch (error) {
      print(error);
    }
    return null;
  }

  User currentUserStatus(){
    return _authRepository.currentUserStatus();
  }

  void signOut(){
    _authRepository.signOut();
  }

  String signUp(String email, String password) {
    try {
      _authRepository.signUp(email,password);
      return 'success';
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<bool> forgotPasswordRequest(String email) async {
    try {
      _authRepository.forgotPasswordRequest(email);
      return true;
    } catch (error) {
      print(error);
    }
    return false;
  }
}
