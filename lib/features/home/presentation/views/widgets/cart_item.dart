import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/custom_network_image.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/cart_item_action_buttoms.dart';
import 'package:fruits_hub_app/main.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: const CustomNetworkImage(
              ImageUrl:
                  'https://tse1.mm.bing.net/th?id=OIP.AzdRE-LcrSDJiOIzdKmQHQHaFS&pid=Api&P=0&h=220',
            ),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('بطيخ', style: AppTextStyles.cairoBold.copyWith()),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text(
                  '3 كم',
                  textAlign: TextAlign.right,
                  style: AppTextStyles.cairoRegular.copyWith(
                    color: KsecondaryColor,
                  ),
                ),

                Row(
                  children: [
                    const CartItemActionButtoms(),
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '60 ',
                            style: AppTextStyles.cairoBold.copyWith(
                              fontSize: 16,
                              color: KsecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: isArabic() ? 'جنيه' : 'EGP',
                            style: AppTextStyles.cairoBold.copyWith(
                              fontSize: 16,
                              color: KsecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
