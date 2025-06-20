import 'package:flutter/material.dart';

import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';

import '../../../domain/entities/notification_entity.dart';
import 'notification_header.dart';

import 'notification_item_list_view.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key, required this.notifications});
  final List<NotificationEntity> notifications;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const NotificationHeader(),
            const SizedBox(height: 13),

            NotificationItemListView(notifications: notifications),
          ],
        ),
      ),
    );
  }
}
