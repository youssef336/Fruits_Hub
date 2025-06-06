import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/text_styles.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyles.cairoRegular.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '150 جنيه',

                style: AppTextStyles.bodyBaseSemibold.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Text(
                'التوصيل:',
                style: AppTextStyles.cairoRegular.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '30جنيه',

                style: AppTextStyles.cairoRegular.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: Color(0xFFCACECE), indent: 32, endIndent: 32),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'الكلي',
                style: AppTextStyles.cairoBold.copyWith(
                  fontSize: 16,
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              const Spacer(),
              Text(
                '180 جنيه',
                style: AppTextStyles.cairoBold.copyWith(
                  fontSize: 16,
                  color: const Color(0xFF0C0D0D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
