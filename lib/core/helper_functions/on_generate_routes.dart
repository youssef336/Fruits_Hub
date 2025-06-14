import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/Sign_in_view.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub_app/features/home/domain/entities/cart_entites.dart';
import 'package:fruits_hub_app/features/home/presentation/views/main_view.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/on_boarding.dart';
import 'package:fruits_hub_app/features/splash/presentation/views/splash_view.dart';

import '../../features/best_selling_fruits/presentation/views/best_selling_view.dart';
import '../../features/check_out/presentation/views/check_out_view.dart';
import '../../features/home/presentation/views/widgets/profile_viewLanguage_page.dart';
import '../../features/home/presentation/views/widgets/profile_view_avtar_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoarding.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoarding());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case BestSellingFruitsView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingFruitsView());
    case ProfileViewLanguagePage.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileViewLanguagePage());
    case ProfileViewAvtarPage.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileViewAvtarPage());
    case CheckOutView.routeName:
      return MaterialPageRoute(
        builder:
            (_) => CheckOutView(cartItems: settings.arguments as CartEntites),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpView(),
      ); // Replace with actual OnBoarding view
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
