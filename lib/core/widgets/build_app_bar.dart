import 'package:flutter/material.dart';

import '../utils/text_styles.dart';
import 'notification_widget.dart';

AppBar buildAppbar(
  BuildContext context, {
  required String title,
  bool showBackButton = true,
}) {
  return AppBar(
    leading: Visibility(
      visible: showBackButton,
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    title: Text(title, style: AppTextStyles.cairoBold19),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
