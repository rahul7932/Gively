import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final IAuthorizationRepository _authRepository;

  AuthService(this._authRepository);

  Future<User> signIn(String email, String password) async {
    try {
      User user =  await _authRepository.signIn(email, password);
      if(user != null){
        _authRepository.saveSecureData(email, password);
      }
      return user;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<User> checkForExistingSignIn()async{
    String password = await _authRepository.checkForSecurePassword();
    String userName = await _authRepository.checkForSecureUsername();
    return await signIn(userName, password);
  }

  void signOut(){
    _authRepository.signOut();
  }

  Future signUp(String email, String password) async {
    try {
      _authRepository.signUp(email,password);
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
