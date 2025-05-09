import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class HomeBestSellerHeader extends StatelessWidget {
  const HomeBestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).Home_Best_Seller_Header,
          textAlign: TextAlign.right,
          style: AppTextStyles.cairoBold.copyWith(
            fontSize: 16,
            color: const Color(0xFF0C0D0D),
          ),
        ),
        Spacer(),
        Text(
          S.of(context).Home_Best_Seller_Header_subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.cairoRegular.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
      ],
    );
  }
}
