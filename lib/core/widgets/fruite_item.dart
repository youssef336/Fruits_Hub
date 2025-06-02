import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';

import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:fruits_hub_app/main.dart';

import 'custom_network_image.dart';

class FruiteItem extends StatelessWidget {
  const FruiteItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                productEntity.imageUrl != null
                    ? Flexible(
                      child: CustomNetworkImage(
                        ImageUrl: productEntity.imageUrl!,
                      ),
                    )
                    : Container(width: 100, height: 100, color: Colors.grey),
                const SizedBox(height: 24),
                ListTile(
                  title: Text(
                    isArabic() ? productEntity.nameAr : productEntity.nameEn,

                    style: AppTextStyles.cairoBold,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${productEntity.price}",
                          style: AppTextStyles.cairoBold.copyWith(
                            color: KsecondaryColor /* Orange-300 */,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: isArabic() ? " جنية" : " EGP",
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
                          text: S.of(context).Frute_first_item_weight,
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
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
