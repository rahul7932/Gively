import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final _secureStorage = FlutterSecureStorage();

class AuthRepository extends IAuthorizationRepository {
  Future<User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (_) {
      return null;
    }
  }

  @override
  void saveSecureData(String email, String password){
    _secureStorage.write(key: 'gively_pass', value: password);
    _secureStorage.write(key: 'gively_username', value: email);
  }

  @override
  Future<String> checkForSecurePassword() async {
    return await _secureStorage.read(key: 'gively_pass');
  }

  @override
  Future<String> checkForSecureUsername() async {
    return await _secureStorage.read(key: 'gively_username');
  }

  @override
  Future<String> signUp(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    try {
      await userCredential.user.sendEmailVerification();
      return userCredential.user.uid;
    } catch (e) {
      print("An error occured while trying to send email verification");
      print(e.message);
    }
    return null;
  }

  @override
  void forgotPasswordRequest(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  void signOut() {
    _auth.signOut();
  }
}
