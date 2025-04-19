import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/Login_view.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/on_boarding.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoarding.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoarding());
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
      ); // Replace with actual OnBoarding view
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
