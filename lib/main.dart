import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/cubits/locale/locale_cubit.dart';
import 'package:fruits_hub_app/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub_app/core/services/custom_bolc_observer.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart/cart_cubit.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub_app/firebase_options.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'features/notification/domain/repo/notification_repo.dart';
import 'features/notification/presentation/manager/cubits/notificationcubit/notificationcubit_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setupGetIt();
  
  // Initialize the app with Phoenix for hot restart support
  runApp(
    Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>(create: (context) => LocaleCubit()),
          BlocProvider<CartCubit>(create: (context) => CartCubit()),
          BlocProvider<NotificationcubitCubit>(
            create: (context) => NotificationcubitCubit(getIt.get<NotificationRepo>()),
          ),
        ],
        child: const NotificationLoader(child: FruitsHubApp()),
      ),
    ),
  );
}

class NotificationLoader extends StatefulWidget {
  final Widget child;
  
  const NotificationLoader({super.key, required this.child});

  @override
  State<NotificationLoader> createState() => _NotificationLoaderState();
}

class _NotificationLoaderState extends State<NotificationLoader> {
  @override
  void initState() {
    super.initState();
    // Load notifications when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationcubitCubit>().addNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class FruitsHubApp extends StatelessWidget {
  const FruitsHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Providers are now in the root widget
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        String locale = Prefs.getString(Klocale);
        return MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state is LocaleChangedtoEnglish
              ? const Locale('en')
              : state is LocaleChangedtoArabic
                  ? const Locale('ar')
                  : Locale(locale.isEmpty ? 'ar' : locale),
          title: 'Fruits Hub',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: KprimaryColor),
            useMaterial3: true,
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashView.routeName,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
