import 'package:fruits_hub_app/core/entities/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntites {
  final List<CartItemEntity> cartItems;

  CartEntites(this.cartItems);
  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  bool isExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, count: 1);
  }

  int calculateTotalCount() {
    int totalCount = 0;
    for (var cartItem in cartItems) {
      totalCount += cartItem.count;
    }
    return totalCount;
  }
}
