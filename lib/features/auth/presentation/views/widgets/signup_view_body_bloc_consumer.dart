import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/auth/presentation/manager/cubits/signup_cubit/signup_cubit_cubit.dart';
import 'package:fruits_hub_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SignUpViewBody();
      },
    );
  }
}
