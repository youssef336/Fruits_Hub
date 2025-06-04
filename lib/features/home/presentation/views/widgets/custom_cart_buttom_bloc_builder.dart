import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_buttom.dart';

import '../../../../../main.dart';
import '../../manager/cubits/cart/cart_cubit.dart';
import '../../manager/cubits/cart_item/cart_item_cubit.dart';

class CustomCartButtomBlocBuilder extends StatelessWidget {
  const CustomCartButtomBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButtom(
          text:
              isArabic()
                  ? 'الدفع ${context.watch<CartCubit>().cartEntites.calculateTotalPrice()} جنيه'
                  : 'Pay ${context.watch<CartCubit>().cartEntites.calculateTotalPrice()} EGP',
          onPressed: () {},
        );
      },
    );
  }
}
