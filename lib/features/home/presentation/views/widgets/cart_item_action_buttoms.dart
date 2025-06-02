import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';

class CartItemActionButtoms extends StatelessWidget {
  const CartItemActionButtoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButtom(
          color: KprimaryColorDark,
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '3',
            textAlign: TextAlign.center,
            style: AppTextStyles.cairoBold.copyWith(fontSize: 16),
          ),
        ),
        CartItemActionButtom(
          color: const Color(0xFFF3F5F7),
          icon: const Icon(Icons.remove, color: Colors.grey),
          onPressed: () {},
        ),
      ],
    );
  }
}

class CartItemActionButtom extends StatelessWidget {
  const CartItemActionButtom({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });
  final Color color;
  final Icon icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        color: color /* Green1-500 */,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: FittedBox(child: icon),
    );
  }
}
