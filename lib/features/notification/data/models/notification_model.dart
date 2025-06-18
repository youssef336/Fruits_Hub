import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String descriptioninEnglish;
  final String descriptioninArabic;
  final String imageUrl;
  final DateTime date;
  final String code;
  final double discount;

  NotificationModel({
    required this.code,
    required this.discount,
    required this.descriptioninEnglish,
    required this.descriptioninArabic,
    required this.imageUrl,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      code: json['code'],
      discount: json['discount'],
      descriptioninArabic: json['descriptionArabic'],
      descriptioninEnglish: json['descriptionEnglish'],
      imageUrl: json['image'],
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      code: entity.code,
      discount: entity.discount,
      descriptioninArabic: entity.descriptioninArabic,
      descriptioninEnglish: entity.descriptioninEnglish,
      imageUrl: entity.imageUrl,
      date: entity.date,
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      code: code,
      discount: discount,
      imageUrl: imageUrl,

      descriptioninArabic: descriptioninArabic,
      descriptioninEnglish: descriptioninEnglish,

      date: date,
    );
  }
}
