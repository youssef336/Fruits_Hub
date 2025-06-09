import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/helper_functions/get_user.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/features/check_out/presentation/manager/cubits/order_cubit/order_cubit.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../../core/repos/ordres_repo/orders_repo.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../domains/entities/order_entity.dart';
import 'widgets/check_out_view_body.dart';
import 'widgets/order_cubit_bloc_consumer.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cartItems});
  static const String routeName = '/CheckOutView';
  final CartEntites cartItems;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppbar(
          context,
          title: S.of(context).CheckOutView_title,
          showNotification: false,
        ),
        body: Provider.value(
          value: OrderEntity(uID: getUser().id, cartEntites: cartItems),
          child: const OrderCubitBlocConsumer(child: CheckOutViewBody()),
        ),
      ),
    );
  }
}
