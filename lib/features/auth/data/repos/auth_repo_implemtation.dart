import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub_app/core/errors/exception.dart';
import 'package:fruits_hub_app/core/errors/failures.dart';
import 'package:fruits_hub_app/core/services/database_servies.dart';
import 'package:fruits_hub_app/core/services/firebase_auth_services.dart';
import 'package:fruits_hub_app/core/utils/back_end_endpoints.dart';
import 'package:fruits_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class AuthRepoImplemtation extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServies databaseServies;
  AuthRepoImplemtation({
    required this.databaseServies,
    required this.firebaseAuthServices,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserModel.fromFireabaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      log("Error in AuthRepoImplemtation.createUserWithEmailAndPassword: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFireabaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Error in AuthRepoImplemtation.signInWithEmailAndPassword: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      return right(UserModel.fromFireabaseUser(user));
    } catch (e) {
      log("Error in AuthRepoImplemtation.signInWithGoogle: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      return right(UserModel.fromFireabaseUser(user));
    } catch (e) {
      log("Error in AuthRepoImplemtation.signInWithFacebook: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServies.addData(
      path: BackEndEndpoints.addUserData,
      data: user.toMap(),
    );
  }
}
