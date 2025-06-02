import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/feature_home_item_buttom.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:fruits_hub_app/main.dart';

class FeatureHomeItem extends StatelessWidget {
  const FeatureHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemwidth = MediaQuery.of(context).size.width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemwidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: isArabic() ? 0 : itemwidth * 0.4,
                bottom: 0,
                top: 0,
                right: isArabic() ? itemwidth * 0.4 : 0,
                child: Image.asset(Assets.imagesPlateFruite, fit: BoxFit.fill),
              ),
              Container(
                width: itemwidth * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.imagesFeaturedItemBackground),
                    fit: BoxFit.fill,
                  ),
                ),

                child: Padding(
                  padding:
                      isArabic()
                          ? const EdgeInsets.only(left: 0, right: 33)
                          : const EdgeInsets.only(left: 33, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        S.of(context).Home_view_feature_home_item_first_text,
                        style: AppTextStyles.cairoRegular.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        S.of(context).Home_view_feature_home_item_second_text,
                        style: AppTextStyles.cairoBold19.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 11),
                      FeatureHomeItemButtom(onPressed: () {}),
                      const SizedBox(height: 29),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
