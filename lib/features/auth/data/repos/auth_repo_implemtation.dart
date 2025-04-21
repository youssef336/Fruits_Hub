import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/errors/failures.dart';
import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';

class AuthRepoImplemtation extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
