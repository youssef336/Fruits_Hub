import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('جديد', style: AppTextStyles.bodyBaseBold),
        const SizedBox(width: 6),
        const CircleAvatar(
          radius: 11,
          backgroundColor: Color(0xFFEBF9F1),
          child: Center(
            child: Text(
              "2",
              style: TextStyle(
                fontSize: 12, // smaller font to fit inside small circle
                fontWeight: FontWeight.bold,
                color: KprimaryColorDark,
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          'تحديد الكل مقروء',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyBaseRegular.copyWith(
            color: const Color(0xFF949D9E),
            height: 1.60,
          ),
        ),
      ],
    );
  }
}
