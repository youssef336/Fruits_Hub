import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
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
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProductToCart(productEntity);
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
            child: CustomFavoriteIconButton(
              productId:
                  isArabic() ? productEntity.nameAr : productEntity.nameEn,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFavoriteIconButton extends StatefulWidget {
  final String productId;

  const CustomFavoriteIconButton({super.key, required this.productId});

  @override
  State<CustomFavoriteIconButton> createState() =>
      _CustomFavoriteIconButtonState();
}

class _CustomFavoriteIconButtonState extends State<CustomFavoriteIconButton> {
  bool isFavorite = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final result = Prefs.getBool(widget.productId);
    setState(() {
      isFavorite = result;
      isLoading = false;
    });
  }

  Future<void> _toggleFavorite() async {
    final newValue = !isFavorite;
    await Prefs.setBool(widget.productId, newValue);
    setState(() {
      isFavorite = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return IconButton(
      onPressed: _toggleFavorite,
      icon:
          isFavorite
              ? const Icon(Icons.favorite, color: Colors.red)
              : const Icon(Icons.favorite_border, color: Colors.grey),
    );
  }
}
