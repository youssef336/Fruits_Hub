import 'package:fruits_hub_app/features/check_out/domains/entities/shiping_address_entity.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';

import '../../../notification/domain/entities/notification_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntites cartEntites;
  bool? payWithCash;
  NotificationEntity? notificationEntity;
  ShipingAddressEntity shipingAddressEntity = ShipingAddressEntity();
  double _appliedDiscount = 0; // internal discount state

  OrderEntity({required this.cartEntites, this.payWithCash, required this.uID});

  void applyCouponCode(String code) {
    if (notificationEntity != null && notificationEntity!.code == code) {
      _appliedDiscount = notificationEntity!.discount;
    } else {
      _appliedDiscount = 0;
    }
  }

  double calculateShipingCost() {
    return (payWithCash ?? false) ? 40 : 0;
  }

  double calulateShipingDiscount() {
    return _appliedDiscount;
  }

  double calculateTotalPriceAfterDiscountAndShiping() {
    return cartEntites.calculateTotalPrice() +
        calculateShipingCost() -
        calulateShipingDiscount();
  }
}
