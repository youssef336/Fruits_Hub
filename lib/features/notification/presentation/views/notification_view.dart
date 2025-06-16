import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/notification/presentation/views/widgets/notification_view_body.dart';

import '../../../../core/widgets/build_app_bar.dart';
import '../../../../generated/l10n.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        context,
        title: S.of(context).Home_Best_Seller_Header,
      ),

      body: const NotificationViewBody(),
    );
  }
}
