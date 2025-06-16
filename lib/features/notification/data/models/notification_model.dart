import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String descriptioninEnglish;
  final String descriptioninArabic;
  final String imageUrl;
  final DateTime date;

  NotificationModel({
    required this.descriptioninEnglish,
    required this.descriptioninArabic,
    required this.imageUrl,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      descriptioninArabic: json['descriptionArabic'],
      descriptioninEnglish: json['descriptionEnglish'],
      imageUrl: json['image'],
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      descriptioninArabic: entity.descriptioninArabic,
      descriptioninEnglish: entity.descriptioninEnglish,
      imageUrl: entity.imageUrl,
      date: entity.date,
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      imageUrl: imageUrl,

      descriptioninArabic: descriptioninArabic,
      descriptioninEnglish: descriptioninEnglish,

      date: date,
    );
  }
}
