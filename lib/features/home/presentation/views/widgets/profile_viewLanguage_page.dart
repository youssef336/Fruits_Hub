// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/locale/locale_cubit.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../generated/l10n.dart';

class ProfileViewLanguagePage extends StatefulWidget {
  const ProfileViewLanguagePage({super.key});
  static const String routeName = '/ProfileViewLanguage';

  @override
  State<ProfileViewLanguagePage> createState() =>
      _ProfileViewLanguagePageState();
}

class _ProfileViewLanguagePageState extends State<ProfileViewLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(
          context,
          title: S.of(context).ProfileViewLanguage,
          showNotification: false,
        ),
        body: Column(
          children: [
            Language_container(
              text: S.of(context).ProfileViewLanguage_value_Item,
            ),
          ],
        ),
      ),
    );
  }
}

class Language_container extends StatelessWidget {
  const Language_container({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<LocaleCubit>().changeLocale();
      },
      child: Text(text, style: AppTextStyles.cairoBold19),
    );
  }
}
