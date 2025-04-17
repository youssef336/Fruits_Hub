import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),

        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: const Color(0xff0E5E39),

            // ignore: deprecated_member_use
            color: const Color(0xff0E5E39).withOpacity(0.5),
          ),
        ),
        SizedBox(height: 19),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
          child: CustomButtom(text: S.of(context).on_boarding_buttom_text),
        ),
        SizedBox(height: 23),
      ],
    );
  }
}
