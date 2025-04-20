import 'package:flutter/cupertino.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/dont_have_an_acoount_widget.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/social_text_buttom.dart';
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
            DontHaveAnAcoountWidget(context),
            const SizedBox(height: 33),
            OrDivider(),
            const SizedBox(height: 16),

            SocialTextButtom(
              image: Assets.imagesGoogleIcon,
              text: S.of(context).on_Login_login_with_google,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            SocialTextButtom(
              image: Assets.imagesApplIcon,
              text: S.of(context).on_Login_login_with_apple,
              onPressed: () {},
            ),
            const SizedBox(height: 16),

            SocialTextButtom(
              image: Assets.imagesFacebookIcon,
              text: S.of(context).on_Login_login_with_facebook,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
