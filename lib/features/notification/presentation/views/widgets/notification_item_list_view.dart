import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';

import '../code_view.dart';
import 'notification_item.dart';

class NotificationItemListView extends StatelessWidget {
  const NotificationItemListView({super.key, required this.notifications});
  final List<NotificationEntity> notifications;
  @override
  Widget build(BuildContext context) {
    int length = notifications.length;

    return Column(
      children: List.generate(
        length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: NotificationItem(
            onTap: () {
              // Update the notification as read
              notifications[index].isRead = false;
              Prefs.setboolNotifier(notifications[index], false).then((_) {
                // Update the unread count
                int unreadCount = notifications.where((n) => !n.isRead).length;
                Prefs.setInt(Knotification, unreadCount);
                // Toggle the notifier to trigger a rebuild
                Prefs.notificationNotifier2.value =
                    !Prefs.notificationNotifier2.value;
              });
              Navigator.pushNamed(
                context,
                CodeView.routeName,
                arguments: notifications[index],
              );
            },

            notification: notifications[index],
          ),
        ),
      ),
    );
  }
}
