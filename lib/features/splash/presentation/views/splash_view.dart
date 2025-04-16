import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
