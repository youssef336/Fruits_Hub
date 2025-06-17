// ignore_for_file: file_names

import 'package:fruits_hub_app/features/check_out/domains/entities/PaypalPaymentEntity/ItemList.dart';
import 'package:fruits_hub_app/features/check_out/domains/entities/order_entity.dart';

import 'Amount.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: "The payment transaction description.",
      itemList: ItemList.fromEntity(items: entity.cartEntites.cartItems),
    );
  }
  toJson() => {
    "amount": amount?.toJson(),
    "description": description,
    "item_list": itemList?.toJson(),
  };
}
