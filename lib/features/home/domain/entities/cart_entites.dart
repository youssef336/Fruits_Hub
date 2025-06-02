import 'cart_item_entity.dart';

class CartEntites {
  final List<CartItemEntity> cartItems;

  CartEntites(this.cartItems);
  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }
}
