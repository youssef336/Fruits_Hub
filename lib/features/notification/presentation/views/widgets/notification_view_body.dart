import 'package:flutter/material.dart';

import 'notification_header.dart';

import 'notification_item_list_view.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            NotificationHeader(),
            SizedBox(height: 13),

            NotificationItemListView(),
          ],
        ),
      ),
    );
  }
}
