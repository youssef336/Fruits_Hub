import 'package:flutter/material.dart';

import 'package:fruits_hub_app/core/utils/text_styles.dart';

import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class CodeView extends StatelessWidget {
  const CodeView({super.key, this.args});
  static const String routeName = '/code';
  final NotificationEntity? args;
  @override
  Widget build(BuildContext context) {
    final notification = args;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).coponView),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: S.of(context).CoponView_title3,
                style: AppTextStyles.bodyBaseBold,
              ),

              TextSpan(
                text: notification!.code.toString(),
                style: AppTextStyles.bodySmallSemibold2.copyWith(
                  color: const Color(0xFFEB5757),
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
