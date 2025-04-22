import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/errors/exception.dart';
import 'package:fruits_hub_app/core/errors/failures.dart';
import 'package:fruits_hub_app/core/services/firebase_auth_services.dart';
import 'package:fruits_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class AuthRepoImplemtation extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  AuthRepoImplemtation({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFireabaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(S.current.Custom_Exception_unknown));
    }
  }
}
