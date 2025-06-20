import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/widgets/fruite_item.dart';

class FavProductsGridView extends StatelessWidget {
  FavProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;
  final List<ProductEntity> favProducts = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: getFavProducts().length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return FruiteItem(productEntity: products[index]);
      },
    );
  }

  List<ProductEntity> getFavProducts() {
    for (var product in products) {
      if (product.isFavorite) {
        favProducts.add(product);
      }
    }
    return favProducts;
  }
}
