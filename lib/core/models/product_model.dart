import 'dart:io';

import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/models/review_model.dart';

class Productmodel {
  final String name;
  final String description;
  final num price;
  final File image;
  final String code;
  final bool isfeatured;
  String? imageurl;
  final int experationMonths;
  final bool isOrganic;
  final int numbersOfCalories;
  final int unitAmount;
  final int sellingcount;
  final num averageRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  Productmodel({
    required this.experationMonths,
    required this.reviews,
    required this.numbersOfCalories,
    required this.unitAmount,
    required this.name,
    required this.isOrganic,
    required this.description,
    required this.price,
    required this.sellingcount,
    required this.image,
    required this.code,
    required this.isfeatured,
    this.imageurl,
  });

  factory Productmodel.fromJson(Map<String, dynamic> json) => Productmodel(
    name: json['name'],
    description: json['description'],
    price: json['price'],
    code: json['code'],
    isfeatured: json['isfeatured'],
    imageurl: json['imageurl'],
    experationMonths: json['experationMonths'],
    isOrganic: json['isOrganic'],
    numbersOfCalories: json['numbersOfCalories'],
    unitAmount: json['unitAmount'],
    reviews: List<ReviewModel>.from(
      json['reviews'].map((x) => ReviewModel.fromJson(x)),
    ),
    sellingcount: json['sellingcount'],
    image: File(json['imageurl']),
  );
  toJson() => {
    'name': name,
    'description': description,
    'price': price,
    'code': code,
    'isfeatured': isfeatured,
    'imageurl': imageurl,
    'experationMonths': experationMonths,
    'isOrganic': isOrganic,
    'numbersOfCalories': numbersOfCalories,
    'unitAmount': unitAmount,
    'reviews': reviews.map((e) => e.toJson()).toList(),
  };
}
