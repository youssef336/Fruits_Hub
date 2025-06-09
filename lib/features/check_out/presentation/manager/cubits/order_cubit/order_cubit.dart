import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub_app/core/repos/ordres_repo/orders_repo.dart';

import '../../../../domains/entities/order_entity.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.ordersRepo) : super(OrderInitial());
  final OrdersRepo ordersRepo;

  Future<void> addOrder({required OrderEntity order}) async {
    emit(OrderLoading());
    final result = await ordersRepo.addOrder(order: order);
    result.fold(
      (failure) => emit(Orderfailure(message: failure.message)),
      (r) => emit(OrderSuccess()),
    );
  }
}
