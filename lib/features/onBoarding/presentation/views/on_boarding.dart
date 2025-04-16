import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/on_boarding_body.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static const routeName = '/onBoarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnBoardingBody()));
  }
}
