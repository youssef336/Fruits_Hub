import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/core/widgets/custom_text_feild.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';
import 'package:fruits_hub_app/features/auth/presentation/manager/cubits/signup_cubit/signup_cubit_cubit.dart';

import 'package:fruits_hub_app/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/terms_and_condations.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SignupCubit(
            getIt<AuthRepo>(), // Use getIt to provide the AuthRepo instance
          ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            S.of(context).on_signup_Signup,
            style: AppTextStyles.bodyLargeBold,
          ),
        ),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
