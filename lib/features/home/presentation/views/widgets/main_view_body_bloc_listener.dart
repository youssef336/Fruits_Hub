import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart_cubit.dart';
import 'package:fruits_hub_app/main.dart';

import 'main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdd) {
          buildErrorBar(
            context,
            isArabic()
                ? "تم إضافة المنتج إلى السلة"
                : "Product added to cart",
          );
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
