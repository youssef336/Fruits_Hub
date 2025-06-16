import 'package:dartz/dartz.dart';

import 'package:fruits_hub_app/core/errors/failures.dart';

import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';

import '../../../../core/services/database_servies.dart';

import '../../../../core/utils/back_end_endpoints.dart';
import '../../domain/repo/notification_repo.dart';
import '../models/notification_model.dart';

class NotificationRepoImpl implements NotificationRepo {
  final DatabaseServies databaseServies;
  NotificationRepoImpl(this.databaseServies);

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      var data =
          await databaseServies.getData(path: BackEndEndpoints.getNotifications)
              as List<Map<String, dynamic>>;
      List<NotificationEntity> notifications =
          (data as List<dynamic>)
              .map((e) => NotificationModel.fromJson(e).toEntity())
              .toList();
      return Right(notifications);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
