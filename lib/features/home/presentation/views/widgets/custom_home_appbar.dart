import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

import '../../../../../core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        S.of(context).Home_view_welcome_appbar,

        style: AppTextStyles.cairoRegular.copyWith(
          color: const Color(0xFF949D9E),
        ),
      ),
      subtitle: Text('أحمد مصطفي', style: AppTextStyles.cairoBold),
      trailing: NotificationWidget(),
    );
  }
}
