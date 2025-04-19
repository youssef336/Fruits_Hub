import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
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
      locale: const Locale("ar"),
      title: 'Fruits Hub',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: KprimaryColor),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
