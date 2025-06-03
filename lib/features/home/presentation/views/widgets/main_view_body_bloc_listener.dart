import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart/cart_cubit.dart';

import '../../../../../generated/l10n.dart';
import 'main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdd) {
          buildErrorBar(context, S.of(context).product_added_to_cart);
        }
        if (state is CartItemRemoved) {
          buildErrorBar(context, S.of(context).product_removed_from_cart);
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
