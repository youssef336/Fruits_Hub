import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/errors/failures.dart';

import '../../../features/check_out/domains/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity order});
}
