import 'package:fruits_hub_app/core/services/firebase_auth_services.dart';
import 'package:fruits_hub_app/features/auth/data/repos/auth_repo_implemtation.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<FirebaseAuthServices>(
    () => FirebaseAuthServices(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplemtation(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
}
