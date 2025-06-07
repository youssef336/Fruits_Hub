import 'package:fruits_hub_app/features/check_out/domains/entities/shiping_address_entity.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final CartEntites cartEntites;
  bool? payWithCash;
  final ShipingAddressEntity? shipingAddressEntity;
  OrderEntity({
    required this.cartEntites,
    this.payWithCash,
    this.shipingAddressEntity,
  });
}
