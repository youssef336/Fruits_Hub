import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart_cubit.dart';

import 'package:fruits_hub_app/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/cart_view_header.dart';
import 'package:fruits_hub_app/main.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppbar(
                    context,
                    title: isArabic() ? 'السلة' : 'Cart',
                    showNotification: false,
                  ),
                  const SizedBox(height: KTopPadding),

                  const CartViewHeader(),
                  const SizedBox(height: 8),
                  // Use BlocBuilder here
                ],
              ),
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntites.cartItems.isEmpty
                      ? const SizedBox()
                      : const CustomDivider(),
            ),
            CartItemList(
              cartItems: context.read<CartCubit>().cartEntites.cartItems,
            ),
            SliverToBoxAdapter(
              child:
                  context.read<CartCubit>().cartEntites.cartItems.isEmpty
                      ? const SizedBox()
                      : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height * 0.07,
          child: Visibility(
            visible: context.read<CartCubit>().cartEntites.cartItems.isNotEmpty,
            child: CustomButtom(
              text:
                  isArabic()
                      ? 'الدفع ${context.watch<CartCubit>().cartEntites.calculateTotalPrice()} جنيه'
                      : 'Pay  ${context.watch<CartCubit>().cartEntites.calculateTotalPrice()} EGP',
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
