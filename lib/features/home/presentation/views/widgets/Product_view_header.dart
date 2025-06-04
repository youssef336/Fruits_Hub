// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/main.dart';

import '../../../../../core/utils/app_images.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productLength});
  final int productLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isArabic() ? "$productLength نتائج" : "$productLength results",
          textAlign: TextAlign.right,
          style: AppTextStyles.cairoBold.copyWith(
            fontSize: 16,
            color: const Color(0xFF0C0D0D),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 26),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.imagesFilter2),
        ),
      ],
    );
  }
}
