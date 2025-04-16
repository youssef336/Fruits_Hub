import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
