import 'package:flutter/cupertino.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormFeild(
              hintText: S.of(context).on_Login_email,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: S.of(context).on_Login_password,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: const Icon(
                CupertinoIcons.eye_fill,
                color: Color((0xFFC9CECF)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  S.of(context).on_Login_forgot_password,
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    color: KprimaryColorLight,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButtom(text: S.of(context).on_Login_login, onPressed: () {}),
            const SizedBox(height: 33),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).on_Login_create_account_text,
                    style: AppTextStyles.bodyBaseSemibold.copyWith(
                      color: const Color(0xFF949D9E) /* Grayscale-600 */,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: AppTextStyles.bodyBaseSemibold.copyWith(
                      color: const Color(0xFF616A6B),
                    ),
                  ),

                  TextSpan(
                    text: S.of(context).on_Login_create_account,
                    style: AppTextStyles.bodyBaseSemibold.copyWith(
                      color: KprimaryColor /* Grayscale-600 */,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
