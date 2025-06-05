import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';

class ProfileViewItem extends StatelessWidget {
  const ProfileViewItem({
    super.key,
    required this.headText,
    required this.value,
    required this.onPressed,
  });
  final String headText;
  final String value;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(shape: RoundedRectangleBorder()),
      child: Row(
        children: [
          Text(headText, style: AppTextStyles.bodyBaseSemibold),
          const Spacer(),
          Text(value, style: AppTextStyles.bodyBaseSemibold),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
