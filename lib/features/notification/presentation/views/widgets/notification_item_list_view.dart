import 'package:flutter/material.dart';

import 'notification_item.dart';

class NotificationItemListView extends StatelessWidget {
  const NotificationItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        10,
        (index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: NotificationItem(),
        ),
      ),
    );
  }
}
