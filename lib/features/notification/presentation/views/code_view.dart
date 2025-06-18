import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_app/features/notification/domain/entities/notification_entity.dart';

class CodeView extends StatelessWidget {
  const CodeView({super.key, this.args});
  static const String routeName = '/code';
  final NotificationEntity? args;
  @override
  Widget build(BuildContext context) {
    final notification = args;

    return Scaffold(
      appBar: AppBar(title: const Text('Code View')),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Discount copon :  ',
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
