import 'package:bloc/bloc.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntites cartEntites = CartEntites([]);
  void addProductToCart(CartItemEntity cartItemEntity) {
    cartEntites.cartItems.add(cartItemEntity);
    emit(CartitemAdded());
  }

  void removeProductFromCart(CartItemEntity cartItemEntity) {
    emit(CartitemRemoved());
  }
}
