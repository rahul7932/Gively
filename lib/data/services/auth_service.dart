import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:Gively/data/models/models.dart';

class AuthService {
  final IAuthorizationRepository _authRepository;

  AuthService(this._authRepository);

  Future<GivelyUser> signIn(String email, String password) async {
    try {
      return await _authRepository.signIn(email, password);
    } catch (error) {
      print(error);
    }
    return null;
  }

  void signOut(){
    _authRepository.signOut();
  }

/*  Future signUp(SignUpRequestModel signUpRequest) async {
    try {
      _authRepository.signUp(signUpRequest);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }*/

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
