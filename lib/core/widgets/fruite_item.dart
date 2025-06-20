import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/providers/favorite_provider.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart/cart_cubit.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:fruits_hub_app/main.dart';

import 'custom_network_image.dart';

class FruiteItem extends StatelessWidget {
  const FruiteItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(productEntity);
    
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
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
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                      ),
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
                            color: KsecondaryColor,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: isArabic() ? " جنية" : " EGP",
                          style: AppTextStyles.cairoBold.copyWith(
                            color: KsecondaryColor,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: "/",
                          style: AppTextStyles.cairoBold.copyWith(
                            color: KsecondaryColorLight,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).Frute_first_item_weight,
                          style: AppTextStyles.cairoBold.copyWith(
                            color: KsecondaryColorLight,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProductToCart(
                            productEntity,
                          );
                    },
                    child: const CircleAvatar(
                      backgroundColor: KprimaryColor,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => favoriteProvider.toggleFavorite(productEntity),
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              splashRadius: 20,
              iconSize: 24,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }
}
