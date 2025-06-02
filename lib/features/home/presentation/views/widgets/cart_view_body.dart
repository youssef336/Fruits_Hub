import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/cart_view_header.dart';
import 'package:fruits_hub_app/main.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
      child: CustomScrollView(
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
                SizedBox(height: KTopPadding),

                const CartViewHeader(),

                // Use BlocBuilder here
                SizedBox(height: 8),
                CartItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
