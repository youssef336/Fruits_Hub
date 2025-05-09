import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class FeatureHomeItemButtom extends StatelessWidget {
  const FeatureHomeItemButtom({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          S.of(context).Home_view_feature_home_item_third_text,
          style: AppTextStyles.cairoBold.copyWith(color: KprimaryColor),
        ),
      ),
    );
  }
}
