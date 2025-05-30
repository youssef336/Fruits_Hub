import 'package:fruits_hub_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    description: 'A red apple',
    price: 10,
    code: 'A1',
    expirationsMonths: 12,
    numbersOfCalories: 100,
    isOrganic: true,
    isFeatured: true,

    unitAmount: 1,
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
