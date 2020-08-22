import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthRepository extends IAuthorizationRepository {
  Future<User> signIn(String email, String password) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  @override
  Future<String> signUp(String email, String password) async {
    try {
      UserCredential user =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await user.user.sendEmailVerification();
      return user.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e.toString());
    }
    return 'An unknown error has occurred. Please try again.';
  }

  @override
  User currentUserStatus() {
    return _auth.currentUser;
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
