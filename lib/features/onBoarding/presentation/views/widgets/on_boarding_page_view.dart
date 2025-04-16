import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/features/onBoarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          backgroundimage: Assets.imagesPageViewItem1BackgroundImage,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            children: [
              Text("مرحبًا بك في FruitHUB"),
              Text("Fruit"),
              Text("HUB"),
            ],
          ),
        ),
      ],
    );
  }
}
