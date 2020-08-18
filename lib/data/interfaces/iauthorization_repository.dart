import 'package:Gively/data/models/models.dart';

abstract class IAuthorizationRepository {
  Future<GivelyUser> signIn(String email, String password);

  void forgotPasswordRequest(String email);

  void signOut();

}
