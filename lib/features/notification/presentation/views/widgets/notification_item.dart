import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 59,
          height: 59,
          decoration: const ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://tse4.mm.bing.net/th?id=OIP.8JIImo-baGGAHtF1L2bDRgHaEP&pid=Api&P=0&h=220",
              ),
              fit: BoxFit.cover,
            ),
            shape: OvalBorder(),
          ),
        ),
        const SizedBox(width: 13),
        SizedBox(
          width: 219,
          child: Text(
            "خصم 50% علي اسعار الفواكه بمناسبه العيد",
            style: AppTextStyles.bodyBaseSemibold.copyWith(height: 1.40),
          ),
        ),
        const SizedBox(width: 13),
        Text(
          "9 صباحا",
          style: AppTextStyles.bodySmallSemibold1.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
      ],
    );
  }
}
