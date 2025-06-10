import '../../domains/entities/order_entity.dart';
import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final String uID;
  final double totalPrice;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.uID,
    required this.totalPrice,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    uID: orderEntity.uID,
    totalPrice: orderEntity.cartEntites.calculateTotalPrice(),
    shippingAddress: ShippingAddressModel.fromEntity(
      orderEntity.shipingAddressEntity,
    ),
    orderProducts:
        orderEntity.cartEntites.cartItems
            .map((e) => OrderProductModel.fromEntity(entity: e))
            .toList(),
    paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
  );
  toJson() => {
    'uID': uID,
    'totalPrice': totalPrice,
    'status': 'Pending',
    'date': DateTime.now().toString(),
    'shippingAddress': shippingAddress.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}
