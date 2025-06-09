import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/helper_functions/get_user.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/build_app_bar.dart';
import '../../domains/entities/order_entity.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cartItems});
  static const String routeName = '/CheckOutView';
  final CartEntites cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        context,
        title: S.of(context).CheckOutView_title,
        showNotification: false,
      ),
      body: Provider.value(
        value: OrderEntity(uID: getUser().id, cartEntites: cartItems),
        child: const CheckOutViewBody(),
      ),
    );
  }
}
