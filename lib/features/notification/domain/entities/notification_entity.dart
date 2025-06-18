import 'package:flutter/widgets.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/main.dart';

class NotificationEntity {
  final String descriptioninEnglish;
  final String descriptioninArabic;
  final String imageUrl;
  final String code;
  final double discount;
  final DateTime date;

  NotificationEntity({
    required this.code,
    required this.discount,
    required this.descriptioninEnglish,
    required this.descriptioninArabic,
    required this.imageUrl,
    required this.date,
  });
  TextSpan notificationDiscount() {
    return TextSpan(
      text: "${discount.toString()}% ",
      style: AppTextStyles.bodySmallSemibold2.copyWith(
        color: const Color(0xFFEB5757),
        fontSize: 17,
      ),
    );
  }

  String notificationBody() {
    return isArabic() ? "$descriptioninArabic " : "$descriptioninEnglish ";
  }
}
