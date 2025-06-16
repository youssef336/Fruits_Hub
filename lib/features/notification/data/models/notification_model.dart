import 'dart:io';

import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String description;
  final File image;
  final DateTime date;

  NotificationModel({
    required this.description,
    required this.image,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      description: json['description'],
      image: File(json['image']),
      date: DateTime.parse(json['date']),
    );
  }

  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      description: entity.description,
      image: entity.image,
      date: entity.date,
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      description: description,
      image: image,
      date: date,
    );
  }
}
