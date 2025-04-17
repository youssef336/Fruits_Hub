import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  int currentPage = 0;

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
          position: 0,
          decorator: DotsDecorator(
            activeColor: KprimaryColor,

            // ignore: deprecated_member_use
            color:
                currentPage == 0
                    ? KprimaryColor.withOpacity(0.5)
                    : KprimaryColor,
          ),
        ),
        SizedBox(height: 19),
        Visibility(
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
            child: CustomButtom(text: S.of(context).on_boarding_buttom_text),
          ),
        ),
        SizedBox(height: 23),
      ],
    );
  }
}
