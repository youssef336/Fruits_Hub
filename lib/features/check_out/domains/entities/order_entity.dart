import 'package:fruits_hub_app/features/check_out/domains/entities/shiping_address_entity.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShipingAddressEntity shipingAddressEntity;
  OrderEntity({
    required this.cartItems,
    required this.payWithCash,
    required this.shipingAddressEntity,
  });
}
