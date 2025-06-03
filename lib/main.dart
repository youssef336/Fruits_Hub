import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_app/core/services/custom_bolc_observer.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart_cubit.dart';

import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub_app/firebase_options.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setupGetIt();
  runApp(const FruitsHubApp());
}

class FruitsHubApp extends StatelessWidget {
  const FruitsHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
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
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: KprimaryColor),
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
