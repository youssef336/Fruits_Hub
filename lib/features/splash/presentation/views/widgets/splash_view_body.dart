// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/firebase_auth_services.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/Sign_in_view.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/on_boarding.dart';

// Splash screen widget that shows animated elements in sequence
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // Animation controller to manage all animations
  late final AnimationController _controller;
  bool isBorderingViewSeen =
      Prefs.getBool(KisBoardingViewSeen) ??
      false; // Flag to check if bordering view is seen
  // Animations for splash bottom element
  late final Animation<double> _bottomScale; // Scale animation
  late final Animation<Alignment> _bottomPosition; // Position animation

  // Animations for plant element
  late final Animation<double> _plantScale; // Scale animation
  late final Animation<Alignment> _plantPosition; // Position animation

  // Animations for logo element
  late final Animation<double> _logoScale; // Scale animation
  late final Animation<double> _logoOpacity; // Fade animation

  @override
  void initState() {
    super.initState();

    // Initialize animation controller with 2 second duration
    _controller = AnimationController(
      vsync: this, // Ticker provider
      duration: const Duration(seconds: 3),
    );

    // Splash Bottom Animation (runs in first 0-0.66s of the 2s duration)
    _bottomScale = Tween<double>(begin: 3.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
      ),
    );

    _bottomPosition = AlignmentTween(
      begin: Alignment.center, // Starts centered
      end: Alignment.bottomCenter, // Moves to bottom
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
      ),
    );

    // Plant Animation (runs in 0.33-1.0s of the 2s duration)
    _plantScale = Tween<double>(begin: 3.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.33, 0.66, curve: Curves.easeInOut),
      ),
    );

    _plantPosition = AlignmentTween(
      begin: Alignment.center, // Starts centered
      end: Alignment.topLeft, // Moves to top-left
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.33, 0.66, curve: Curves.easeInOut),
      ),
    );

    // Logo Animation (runs in last 0.66-1.0s of the 2s duration)
    _logoScale = Tween<double>(begin: 3.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.66, 1.0, curve: Curves.elasticOut),
      ),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.66, 1.0, curve: Curves.easeInOut),
      ),
    );
    Future.delayed(const Duration(seconds: 4), () {
      if (isBorderingViewSeen) {
        var isLoggedIn = FirebaseAuthServices().isUserLoggedIn();
        if (isLoggedIn) {
          // User is logged in, navigate to home
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        } else {
          // User is not logged in, navigate to sign-in
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoarding.routeName);
      }
    });
    // Start all animations
    _controller.forward();
  }

  @override
  void dispose() {
    // Clean up animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Stack(
            children: [
              // Splash Bottom - Background element (always visible)
              Align(
                alignment: Alignment(
                  _bottomPosition.value.x,
                  _bottomPosition.value.y,
                ), // Fixed at bottom center
                child: Transform.scale(
                  scale: _bottomScale.value, // Animated scale
                  child: SvgPicture.asset(
                    Assets.imagesSplashBottom,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Plant - Only visible after 33% of animation completes
              if (_controller.value > 0.33)
                Align(
                  alignment: Alignment(
                    _plantPosition.value.x, // Animated X position
                    _plantPosition.value.y, // Animated Y position
                  ),
                  child: Transform.scale(
                    scale: _plantScale.value, // Animated scale
                    child: SvgPicture.asset(Assets.imagesPlant),
                  ),
                ),

              // Logo - Only visible after 66% of animation completes
              if (_controller.value > 0.66)
                Center(
                  child: Opacity(
                    opacity: _logoOpacity.value, // Animated opacity
                    child: Transform.scale(
                      scale: _logoScale.value, // Animated scale
                      child: SvgPicture.asset(Assets.imagesLogo),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
