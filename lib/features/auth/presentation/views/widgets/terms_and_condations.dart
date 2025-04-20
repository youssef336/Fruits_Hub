import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/custom_chek_box.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:fruits_hub_app/main.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomChekBox(
          onChanged: (value) {
            isTermsAccepted = value;
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        SizedBox(
          width:
              MediaQuery.of(context).size.width - (KhorzontalPadding * 2) - 48,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).on_signup_TermsandConditions,
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: const Color(0xFF949D9E) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: S.of(context).on_signup_TermsandConditions_text,
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: KprimaryColorLight /* Green1-600 */,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: const Color(0xFF616A6B) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: S.of(context).on_signup_TermsandConditions_text2,
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: KprimaryColorLight /* Green1-600 */,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: const Color(0xFF616A6B) /* Grayscale-600 */,
                  ),
                ),
                TextSpan(
                  text: S.of(context).on_signup_TermsandConditions_text3,
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: KprimaryColorLight /* Green1-600 */,
                  ),
                ),
              ],
            ),
            textAlign: isArabic() ? TextAlign.right : TextAlign.left,
          ),
        ),
      ],
    );
  }
}
