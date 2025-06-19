import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/notification/presentation/manager/cubits/notificationcubit/notificationcubit_cubit.dart';
import 'package:fruits_hub_app/features/notification/presentation/views/code_view.dart';
import 'package:fruits_hub_app/main.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  NotificationItem({
    super.key,
    required this.notification,
    required this.length,
    required this.isRead,
  });
  final NotificationEntity notification;
  final int length;
  bool isRead;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Mark as read if needed
        if (!isRead) {
          // Update local state
          isRead = true;
          notification.isRead = true;
          
          // Notify cubit to update the unread count
          context.read<NotificationcubitCubit>().markAsRead();
        }

        // Navigate to notification details
        Navigator.pushNamed(
          context,
          CodeView.routeName,
          arguments: notification,
        ).then((_) {
          // Optional: Refresh the notification list if needed when returning
          if (context.mounted) {
            // You might want to add a callback to refresh the parent widget
            // For example: widget.onNotificationRead?.call();
          }
        });
      },
      child: Row(
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
    );
  }
}
