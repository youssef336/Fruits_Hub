// product_entity.dart

import 'package:fruits_hub_app/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numbersOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.reviews,
    required this.expirationsMonths,
    required this.numbersOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    required this.isFeatured,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
    name,
    code,
    description,
    price,
    isFeatured,
    imageUrl,
    expirationsMonths,
    isOrganic,
    numbersOfCalories,
    unitAmount,
    reviews,
  ];
}
