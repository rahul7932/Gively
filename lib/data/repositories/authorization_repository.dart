import 'package:Gively/data/interfaces/iauthorization_repository.dart';
import 'package:Gively/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final _firestore = Firestore.instance;

class AuthRepository extends IAuthorizationRepository {
  Future<User> signIn(String email, String password) async {
    var result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    var user = new User(
     uid: result.user.uid,
    );
    return user;
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
