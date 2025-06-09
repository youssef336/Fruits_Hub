import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/widgets/custom_modal_progress_hub.dart';
import 'package:fruits_hub_app/features/check_out/presentation/manager/cubits/order_cubit/order_cubit.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';

class OrderCubitBlocConsumer extends StatelessWidget {
  const OrderCubitBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccess) {
          showErrorBar(context, "Order Placed Successfully");
          Navigator.pop(context);
        }
        if (state is Orderfailure) {
          showErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is OrderLoading ? true : false,
          child: child,
        );
      },
    );
  }
}
