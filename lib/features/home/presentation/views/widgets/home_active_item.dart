import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/main.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:
            isArabic()
                ? EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                )
                : const EdgeInsets.only(right: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37) /* Green1-500 */,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: AppTextStyles.cairoBold.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: KprimaryColorDark /* Green1-500 */,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
