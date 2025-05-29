import 'dart:io';

import 'package:fruits_hub_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    description: 'A red apple',
    price: 10,
    code: 'A1',
    isfeatured: true,
    imageurl: 'https://example.com/apple.jpg',
    experationMonths: 6,
    isOrganic: true,
    numbersOfCalories: 100,
    unitAmount: 1,
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
