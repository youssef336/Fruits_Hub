import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_images.dart';
import 'order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const OrderSummaryWidget(),
        const SizedBox(height: 16),
        PaymentItem(
          title: 'عنوان التوصيل :',
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesLocation),
                  const SizedBox(width: 8),
                  Text(
                    'شارع النيل، مبنى رقم ١٢٣',
                    style: AppTextStyles.cairoRegular.copyWith(
                      fontSize: 16,
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.imagesEdit),
                        const SizedBox(width: 4),
                        Text(
                          'تعديل',
                          style: AppTextStyles.bodyBaseSemibold.copyWith(
                            fontSize: 13,
                            color: const Color(0xFF949D9E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
