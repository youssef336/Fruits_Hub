import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [OnBoardingPageView()]);
  }
}
