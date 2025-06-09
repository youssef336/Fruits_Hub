import 'package:fruits_hub_app/features/check_out/domains/entities/shiping_address_entity.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';

class OrderEntity {
  final String uID;
  final CartEntites cartEntites;
  bool? payWithCash;
  ShipingAddressEntity shipingAddressEntity = ShipingAddressEntity();
  OrderEntity({required this.cartEntites, this.payWithCash, required this.uID});
}
