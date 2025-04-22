import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub_app/core/errors/exception.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(
          message: S.current.Custom_Exception_weak_password,
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: S.current.Custom_Exception_email_already_in_use,
        );
      } else {
        throw CustomException(message: S.current.Custom_Exception_unknown);
      }
    } catch (e) {
      throw CustomException(message: S.current.Custom_Exception_unknown);
    }
  }
}
