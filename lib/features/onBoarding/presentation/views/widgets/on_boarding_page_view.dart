import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

import 'package:fruits_hub_app/main.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
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
                      color: const Color(0xff0E5E39),
                    ),
                  ),
              isArabic()
                  ? Text(
                    "Fruit",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: const Color(0xff0E5E39),
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
