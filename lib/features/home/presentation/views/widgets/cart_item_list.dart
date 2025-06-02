import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/cart_item.dart';

import '../../../../../constant.dart';
import '../../../domain/entities/cart_item_entity.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),

          child: CartItem(cartItemEntity: cartItems[index]),
        );
      },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Color(0xFFF1F1F5), height: 22);
  }
}
