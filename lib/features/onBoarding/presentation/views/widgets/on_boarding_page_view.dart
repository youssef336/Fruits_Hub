import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

import 'package:fruits_hub_app/main.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) ==
              0,
          image: Assets.imagesPageViewItem1Image,
          backgroundimage: Assets.imagesPageViewItem1BackgroundImage,
          subtitle: S.of(context).on_boarding_subtitle,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).on_boarding_title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
              ),

              isArabic()
                  ? Text(
                    "HUB",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: Colors.orange,
                    ),
                  )
                  : Text(
                    "Fruit",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: KprimaryColor,
                    ),
                  ),
              isArabic()
                  ? Text(
                    "Fruit",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: KprimaryColor,
                    ),
                  )
                  : Text(
                    "HUB",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: Colors.orange,
                    ),
                  ),
            ],
          ),
        ),
        PageViewItem(
          isVisible:
              (pageController.hasClients ? pageController.page!.round() : 0) !=
              1,

          image: Assets.imagesPageViewItem2Image,
          backgroundimage: Assets.imagesPageViewItem2BackgroundImage,
          subtitle: S.of(context).on_boarding_subtitle2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).on_boarding_title2,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
