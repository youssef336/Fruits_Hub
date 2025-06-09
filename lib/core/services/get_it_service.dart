import 'package:fruits_hub_app/core/repos/ordres_repo/orders_repo.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_hub_app/core/services/database_servies.dart';
import 'package:fruits_hub_app/core/services/firebase_auth_services.dart';
import 'package:fruits_hub_app/core/services/firestore_services.dart';
import 'package:fruits_hub_app/features/auth/data/repos/auth_repo_implemtation.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../repos/ordres_repo/orders_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<FirebaseAuthServices>(
    () => FirebaseAuthServices(),
  );
  getIt.registerLazySingleton<DatabaseServies>(() => FirestoreServices());
  getIt.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(getIt<DatabaseServies>()),
  );
  getIt.registerLazySingleton<OrdersRepo>(
    () => OrdersRepoImpl(databaseServies: getIt<DatabaseServies>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplemtation(
      databaseServies: getIt<DatabaseServies>(),
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
    ),
  );
}
