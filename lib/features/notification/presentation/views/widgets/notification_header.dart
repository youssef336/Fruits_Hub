import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';

import '../../../../../generated/l10n.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});
  // The count is now obtained from Prefs.notificationNotifier
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Prefs.notificationNotifier,
      builder: (context, value, _) {
        return Row(
          children: [
            Text(
              S.of(context).NotificationHeader_new,
              style: AppTextStyles.bodyBaseBold,
            ),
            const SizedBox(width: 6),
            CircleAvatar(
              radius: 11,
              backgroundColor: const Color(0xFFEBF9F1),
              child: Center(
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 12, // smaller font to fit inside small circle
                    fontWeight: FontWeight.bold,
                    color: KprimaryColorDark,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              S.of(context).NotificationHeader_viewAll,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyBaseRegular.copyWith(
                color: const Color(0xFF949D9E),
                height: 1.60,
              ),
            ),
          ],
        );
      },
    );
  }
}
