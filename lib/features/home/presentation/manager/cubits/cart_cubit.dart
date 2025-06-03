// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';

import 'package:meta/meta.dart';

import '../../../domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntites cartEntites = CartEntites([]);
  void addProductToCart(ProductEntity productEntity) {
    bool isProductExist = cartEntites.isExist(productEntity);
    var cartItem = cartEntites.getCartItem(productEntity);
    if (isProductExist) {
      cartItem.icreaseCount();
    } else {
      cartEntites.cartItems.add(cartItem);
    }
    emit(CartItemAdd());
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartEntites.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
