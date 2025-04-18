import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';

AppBar Custom_app_bar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppTextStyles.bodyLargeBold,
    ),
  );
}
