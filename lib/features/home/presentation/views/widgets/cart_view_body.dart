import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';

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
            const SliverToBoxAdapter(child: CustomDivider()),
            const CartItemList(),
            const SliverToBoxAdapter(child: CustomDivider()),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height * 0.07,
          child: CustomButtom(
            text: isArabic() ? 'الدفع  120جنيه' : 'Pay  120 EGP',
            onPressed: () {},
          ),
        ),
        const Text("dss"),
      ],
    );
  }
}
