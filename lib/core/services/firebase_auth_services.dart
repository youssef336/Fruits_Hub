import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub_app/core/errors/exception.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      log(
        "Error in FirebaseAuthServices.createUserWithEmailAndPassword: $e code: ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomException(
          message: S.current.Custom_Exception_weak_password,
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: S.current.Custom_Exception_email_already_in_use,
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: S.current.Custom_Exception_network_request_failed,
        );
      } else if (e.code == 'invalid-email') {
        throw CustomException(
          message: S.current.Custom_Exception_invalid_email,
        );
      } else {
        throw CustomException(message: S.current.Custom_Exception_unknown);
      }
    } catch (e) {
      log("Error in FirebaseAuthServices.createUserWithEmailAndPassword: $e");
      throw CustomException(message: S.current.Custom_Exception_unknown);
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Error in FirebaseAuthServices.signInWithEmailAndPassword: $e code: ${e.code} message: ${e.message} ",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message:
              S.current.Custom_Exception_there_is_problem_in_email_or_password,
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message:
              S.current.Custom_Exception_there_is_problem_in_email_or_password,
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
          message: S.current.Custom_Exception_network_request_failed,
        );
      } else if (e.code == 'invalid-email') {
        throw CustomException(
          message: S.current.Custom_Exception_invalid_email,
        );
      } else {
        throw CustomException(
          message:
              S.current.Custom_Exception_there_is_problem_in_email_or_password,
        );
      }
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
