import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/custom_network_image.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/cart_item_action_buttoms.dart';
import 'package:fruits_hub_app/main.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../manager/cubits/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
              ImageUrl: cartItemEntity.productEntity.imageUrl!,
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
                    Text(
                      isArabic()
                          ? cartItemEntity.productEntity.nameAr
                          : cartItemEntity.productEntity.nameEn,
                      style: AppTextStyles.cairoBold.copyWith(),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().deleteCartItem(
                          cartItemEntity,
                        );
                      },
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${cartItemEntity.calculateTotalWeight()}",

                        style: AppTextStyles.cairoRegular.copyWith(
                          color: KsecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: isArabic() ? 'كيلو' : 'Kg',
                        style: AppTextStyles.cairoRegular.copyWith(
                          color: KsecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    CartItemActionButtoms(cartItemEntity: cartItemEntity),
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${cartItemEntity.calculateTotalPrice()}',
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
