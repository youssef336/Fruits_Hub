import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/core/widgets/Custom_app_bar.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/Login_view_body.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_app_bar(context, title: S.of(context).on_Login_login),
      // body: const LoginViewBody(),
      body: LoginViewBody(),
    );
  }
}
