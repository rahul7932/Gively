import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthRepository extends IAuthorizationRepository {
  Future<User> signIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<String> signUp(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
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
