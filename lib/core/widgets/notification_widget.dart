import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/features/notification/presentation/manager/cubits/notificationcubit/notificationcubit_cubit.dart';

import '../../constant.dart';
import '../../features/notification/presentation/views/notification_view.dart';
import '../utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationcubitCubit, dynamic>(
      builder: (context, state) {
        int unreadCount = 0;
        
        if (state is NotificationcubitSuccess) {
          unreadCount = state.notifications.where((n) => !n.isRead).length;
          // Update SharedPreferences to keep it in sync
          Prefs.setInt(Knotification, unreadCount);
        } else {
          // Fallback to SharedPreferences if state is not loaded yet
          unreadCount = Prefs.getInt(Knotification) ?? 0;
        }

        return GestureDetector(
      onTap: () {
        context.read<NotificationcubitCubit>().addNotification();
        Navigator.pushNamed(context, NotificationView.routeName);
      },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const ShapeDecoration(
                  color: Color(0xFFEEF8ED) /* green-50 */,
                  shape: OvalBorder(),
                ),
                child: SvgPicture.asset(Assets.imagesNotification),
              ),
              if (unreadCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
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
                        unreadCount > 9 ? '9+' : '$unreadCount',
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
