import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../domains/entities/order_entity.dart';

class AddressSummaryWidget extends StatelessWidget {
  const AddressSummaryWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: S.of(context).AddressSummaryWidget_title,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.imagesLocation),
              const SizedBox(width: 8),
              Text(
                '${context.read<OrderEntity>().shipingAddressEntity}',
                style: AppTextStyles.cairoRegular.copyWith(
                  fontSize: 16,
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap:
                    () => pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    ),
                child: SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.imagesEdit),
                      const SizedBox(width: 4),
                      Text(
                        S.of(context).AddressSummaryWidget_change,
                        style: AppTextStyles.bodyBaseSemibold.copyWith(
                          fontSize: 13,
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
