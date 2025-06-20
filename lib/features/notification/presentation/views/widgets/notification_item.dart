import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/main.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });
  final NotificationEntity notification;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Prefs.notificationNotifier2,
      builder: (context, value, _) {
        // Force rebuild when notificationNotifier2 changes
        bool isRead = Prefs.getBoolNotifier(notification.notificationId);
        return GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Row(
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
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: isArabic() ? "خصم " : "Discount ",
                            style: AppTextStyles.bodySmallSemibold2.copyWith(
                              color: const Color(0xFF0C0D0D),
                            ),
                          ),
                          notification.notificationDiscount(),
                          TextSpan(
                            text: notification.notificationBody(),
                            style: AppTextStyles.bodySmallSemibold2.copyWith(
                              color: const Color(0xFF0C0D0D),
                            ),
                          ),
                        ],
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
              ),

              isRead
                  ? const CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.transparent,
                  )
                  : const CircleAvatar(
                    radius: 7,
                    backgroundColor: KprimaryColorLight,
                  ),
            ],
          ),
        );
      },
    );
  }
}
