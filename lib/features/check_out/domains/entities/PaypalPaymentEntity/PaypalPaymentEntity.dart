import 'package:fruits_hub_app/features/check_out/domains/entities/PaypalPaymentEntity/ItemList.dart';

import 'Amount.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(PaypalPaymentEntity entity) {
    return PaypalPaymentEntity(
      amount: entity.amount,
      description: entity.description,
      itemList: entity.itemList,
    );
  }
}
