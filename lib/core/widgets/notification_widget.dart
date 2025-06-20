import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';

import '../../features/notification/presentation/views/notification_view.dart';
import '../utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: Prefs.notificationNotifier,
      builder: (context, index, _) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, NotificationView.routeName);
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const ShapeDecoration(
                  color: Color(0xFFEEF8ED),
                  shape: OvalBorder(),
                ),
                child: SvgPicture.asset(Assets.imagesNotification),
              ),
              if (index > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "$index",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
