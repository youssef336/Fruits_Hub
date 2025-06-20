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
    int index1 = 0;
    return Column(
      children: List.generate(
        length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: NotificationItem(
            onTap: () {
              Prefs.setboolNotifier(
                notifications[index],
                notifications[index].isRead = true,
              );
              for (var element in notifications) {
                if (element.isRead == false) {
                  index1 = index1 + 1;
                  Prefs.setInt(Knotification, index1);
                } else {
                  Prefs.setInt(Knotification, index1);
                }
              }
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
