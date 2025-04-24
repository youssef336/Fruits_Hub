import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';

import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/Sign_in_view.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  @override
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundimage,
    required this.subtitle,
    required this.title,
    required this.isVisible,
  });
  final String image, backgroundimage;
  final String subtitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundimage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(KisBoardingViewSeen, true);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(SigninView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      S.of(context).on_boarding_skip,
                      style: AppTextStyles.bodySmallRegular.copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyBaseSemibold.copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        ),
      ],
    );
  }
}
