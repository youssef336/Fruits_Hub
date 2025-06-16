import 'package:flutter/material.dart';
import 'package:fruits_hub_app/main.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});
  final NotificationEntity notification;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 59,
          height: 59,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(notification.imageUrl),
              fit: BoxFit.cover,
            ),
            shape: const OvalBorder(),
          ),
        ),
        const SizedBox(width: 13),
        SizedBox(
          width: 219,
          child:
              isArabic()
                  ? Text(
                    notification.descriptioninArabic,
                    style: AppTextStyles.bodyBaseSemibold.copyWith(
                      height: 1.40,
                    ),
                  )
                  : Text(
                    notification.descriptioninEnglish,
                    style: AppTextStyles.bodyBaseSemibold.copyWith(
                      height: 1.40,
                    ),
                  ),
        ),
        const SizedBox(width: 13),
        SizedBox(
          width: 59,
          child: Column(
            children: [
              Text(
                DateFormat.jm().format(notification.date),
                style: AppTextStyles.bodySmallSemibold1.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
              Text(
                DateFormat.yMd().format(notification.date),
                style: AppTextStyles.bodySmallSemibold1.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
