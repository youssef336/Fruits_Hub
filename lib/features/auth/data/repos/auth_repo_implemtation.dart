// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/errors/exception.dart';
import 'package:fruits_hub_app/core/errors/failures.dart';
import 'package:fruits_hub_app/core/services/database_servies.dart';
import 'package:fruits_hub_app/core/services/firebase_auth_services.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
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
      var userEntity = UserEntity(id: user.uid, name: name, email: email);
      await addUserData(user: userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      await DeleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await DeleteUser(user);
      log("Error in AuthRepoImplemtation.createUserWithEmailAndPassword: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  Future<void> DeleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
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
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Error in AuthRepoImplemtation.signInWithEmailAndPassword: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFireabaseUser(user);
      await saveUserData(user: userEntity);
      var isUserExists = await databaseServies.checkifDataExists(
        path: BackEndEndpoints.checkifUserDataExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await DeleteUser(user);
      log("Error in AuthRepoImplemtation.signInWithGoogle: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFireabaseUser(user);
      await saveUserData(user: userEntity);

      var isUserExists = await databaseServies.checkifDataExists(
        path: BackEndEndpoints.checkifUserDataExists,
        documentId: user.uid,
      );
      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await DeleteUser(user);
      log("Error in AuthRepoImplemtation.signInWithFacebook: $e");
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServies.addData(
      path: BackEndEndpoints.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.id,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseServies.getData(
      path: BackEndEndpoints.getUserData,
      docuementId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(KUserData, jsonData);
  }
}
