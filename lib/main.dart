import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/splash/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitsHubApp());
}

class FruitsHubApp extends StatelessWidget {
  const FruitsHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits Hub',
      theme: ThemeData(primarySwatch: Colors.green),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
