import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub_app/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

void main() {
  runApp(const FruitsHubApp());
}

class FruitsHubApp extends StatelessWidget {
  const FruitsHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      title: 'Fruits Hub',
      theme: ThemeData(primarySwatch: Colors.green),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
