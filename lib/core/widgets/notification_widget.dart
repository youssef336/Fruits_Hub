import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/features/notification/presentation/manager/cubits/notificationcubit/notificationcubit_cubit.dart';

import '../../features/notification/presentation/views/notification_view.dart';
import '../utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NotificationcubitCubit>().addNotification();
        Navigator.pushNamed(context, NotificationView.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: Color(0xFFEEF8ED) /* green-50 */,
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
