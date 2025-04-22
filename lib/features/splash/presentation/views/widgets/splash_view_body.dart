// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone_service.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/Login_view.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/on_boarding.dart';
import 'package:fruits_hub_app/main.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  bool _showLogo = false;
  bool isBorderingViewSeen = Prefs.getBool(KisBoardingViewSeen) ?? false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    // Show logo after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _showLogo = true);
      _animationController.forward().then((_) {
        // Navigate after animation completes
        Future.delayed(const Duration(seconds: 1), () {
          if (isBorderingViewSeen) {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, OnBoarding.routeName);
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment:
                isArabic() ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [SvgPicture.asset(Assets.imagesPlant)],
          ),
          Center(
            child:
                _showLogo
                    ? animation_splash_view()
                    : const SizedBox(), // Empty while waiting
          ),
          SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
        ],
      ),
    );
  }

  AnimatedBuilder animation_splash_view() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: SvgPicture.asset(Assets.imagesLogo),
          ),
        );
      },
    );
  }
}
