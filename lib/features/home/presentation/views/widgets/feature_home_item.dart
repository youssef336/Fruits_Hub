import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/feature_home_item_buttom.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class FeatureHomeItem extends StatelessWidget {
  const FeatureHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(Assets.imagesWatermelonTest),
          Container(
            child: Column(
              children: [
                Text(
                  S.of(context).Home_view_feature_home_item_first_text,
                  style: AppTextStyles.cairoRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  S.of(context).Home_view_feature_home_item_second_text,
                  style: AppTextStyles.cairoBold19.copyWith(
                    color: Colors.white,
                  ),
                ),
                FeatureHomeItemButtom(onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
