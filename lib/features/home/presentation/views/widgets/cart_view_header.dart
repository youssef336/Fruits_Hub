import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/main.dart';

import '../../../../../core/utils/text_styles.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),

      decoration: const BoxDecoration(color: Color(0xFFEBF9F1) /* Green1-50 */),
      child: Center(
        child: Text(
          isArabic()
              ? 'لديك 3 منتجات في سله التسوق'
              : ' You have 3 items in your cart',
          style: AppTextStyles.cairoRegular.copyWith(
            height: 1.60,
            color: KprimaryColor,
          ),
        ),
      ),
    );
  }
}
