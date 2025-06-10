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

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartItems});
  static const String routeName = '/CheckOutView';
  final CartEntites cartItems;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(uID: getUser().id, cartEntites: widget.cartItems);
  }

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
          value: orderEntity,
          child: const OrderCubitBlocConsumer(child: CheckOutViewBody()),
        ),
      ),
    );
  }
}
