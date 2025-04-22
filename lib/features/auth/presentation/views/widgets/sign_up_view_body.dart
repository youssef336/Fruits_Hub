import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/terms_and_condations.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignupViewBody(context);
  }

  SingleChildScrollView SignupViewBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormFeild(
              hintText: S.of(context).on_signup_name,
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: S.of(context).on_signup_email,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: S.of(context).on_signup_password,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: const Icon(
                CupertinoIcons.eye_fill,
                color: Color(0xFFC9CECF),
              ),
            ),
            const SizedBox(height: 16),
            TermsAndConditionsWidget(),
            const SizedBox(height: 30),
            CustomButtom(
              text: S.of(context).on_signup_create_NewAccount,
              onPressed: () {},
            ),
            const SizedBox(height: 26),
            HaveAnAcoountWidget(context),
          ],
        ),
      ),
    );
  }
}
