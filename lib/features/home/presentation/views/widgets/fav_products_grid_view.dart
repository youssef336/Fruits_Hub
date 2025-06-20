import 'package:flutter/material.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/providers/favorite_provider.dart';
import 'package:fruits_hub_app/core/widgets/fruite_item.dart';

class FavProductsGridView extends StatelessWidget {
  const FavProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    // Filter favorite products on every build using FavoriteProvider
    final favProducts =
        products
            .where((product) => favoriteProvider.isFavorite(product))
            .toList();
    if (favProducts.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.favorite_border_rounded,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).ProfileViewFavouritesBody1,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                S.of(context).ProfileViewFavouritesBody2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      itemCount: favProducts.length,
      padding: const EdgeInsets.only(bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return FruiteItem(productEntity: favProducts[index]);
      },
    );
  }
}
