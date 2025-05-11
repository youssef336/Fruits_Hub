import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:fruits_hub_app/main.dart';

class FruiteItem extends StatelessWidget {
  const FruiteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(Assets.imagesWatermelonTest),
                const SizedBox(height: 24),
                ListTile(
                  title: Text(
                    S.of(context).Frute_first_item,

                    style: AppTextStyles.cairoBold,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              isArabic()
                                  ? S.of(context).Frute_first_item_price
                                  : S.of(context).Frute_first_item_weight,
                          style: AppTextStyles.cairoBold.copyWith(
                            color: KsecondaryColor /* Orange-300 */,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: "/",
                          style: AppTextStyles.cairoBold.copyWith(
                            color: KsecondaryColorLight /* Orange-300 */,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text:
                              isArabic()
                                  ? S.of(context).Frute_first_item_weight
                                  : S.of(context).Frute_first_item_price,
                          style: AppTextStyles.cairoBold.copyWith(
                            color: KsecondaryColorLight /* Grey-300 */,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: KprimaryColor,

                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
