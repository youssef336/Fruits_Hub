// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fruits_hub_app/core/widgets/custom_divider.dart';

import '../../../../../core/cubits/avatar/avatar_cubit.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../generated/l10n.dart';

class ProfileViewAvtarPage extends StatefulWidget {
  const ProfileViewAvtarPage({super.key});
  static const String routeName = '/ProfileViewAvtarPage';

  @override
  State<ProfileViewAvtarPage> createState() => _ProfileViewAvtarPageState();
}

class _ProfileViewAvtarPageState extends State<ProfileViewAvtarPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AvatarCubit(),
      child: const ProfileViewAvtarBody(),
    );
  }
}

class ProfileViewAvtarBody extends StatelessWidget {
  const ProfileViewAvtarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          children: [
            buildAppbar(
              context,
              title: S.of(context).ProfileViewLanguage,
              showNotification: false,
            ),
            GestureDetector(
              onTap: () {
                context.read<AvatarCubit>().changeAvatar(Assets.imagesAvatar1);
                Phoenix.rebirth(context);
              },
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Image.asset(Assets.imagesAvatar1),
              ),
            ),
            const CustomDivider(),
            GestureDetector(
              onTap: () {
                context.read<AvatarCubit>().changeAvatar(Assets.imagesAvatar2);
                Phoenix.rebirth(context);
              },
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Image.asset(Assets.imagesAvatar2),
              ),
            ),
            const CustomDivider(),
            GestureDetector(
              onTap: () {
                context.read<AvatarCubit>().changeAvatar(Assets.imagesAvatar3);
                Phoenix.rebirth(context);
              },
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Image.asset(Assets.imagesAvatar3),
              ),
            ),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
