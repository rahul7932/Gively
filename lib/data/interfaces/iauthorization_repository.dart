import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthorizationRepository {
  Future<User> signIn(String email, String password);

  void forgotPasswordRequest(String email);

  void signOut();

  Future<String> signUp(String email, String password);
  Future<String> checkForSecurePassword();
  Future<String> checkForSecureUsername();
  void saveSecureData(String email, String password);
}
