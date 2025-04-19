import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/Login_view.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();

      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: KprimaryColor,
            color:
                currentPage == 1
                    ? KprimaryColor
                    : KprimaryColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 25),

        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
            child: CustomButtom(
              onPressed: () {
                Prefs.setBool(KisBoardingViewSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              text: S.of(context).on_boarding_buttom_text,
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
