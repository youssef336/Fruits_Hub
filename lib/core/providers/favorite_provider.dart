import 'package:flutter/foundation.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';

class FavoriteProvider extends ChangeNotifier {
  final Map<String, bool> _favorites = {};

  bool isFavorite(ProductEntity product) {
    // Check in-memory cache first, then fall back to shared preferences
    if (!_favorites.containsKey(product.nameAr)) {
      _favorites[product.nameAr] = Prefs.getBoolNotifier(product.nameAr);
    }
    return _favorites[product.nameAr] ?? false;
  }

  void toggleFavorite(ProductEntity product) {
    final newFavoriteState = !isFavorite(product);
    // Update in-memory cache
    _favorites[product.nameAr] = newFavoriteState;
    // Update shared preferences
    Prefs.setBool(product.nameAr, newFavoriteState);
    // Update the product's isFavorite property for consistency
    product.isFavorite = newFavoriteState;
    // Notify listeners to rebuild dependent widgets
    notifyListeners();
  }

  // Load all favorites from shared preferences (can be called on app startup)
  Future<void> loadFavorites(List<ProductEntity> products) async {
    for (var product in products) {
      _favorites[product.nameAr] = Prefs.getBoolNotifier(product.nameAr);
      product.isFavorite = _favorites[product.nameAr] ?? false;
    }
  }
}
