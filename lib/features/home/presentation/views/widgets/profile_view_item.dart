import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import 'profile_viewLanguage_page.dart';

class ProfileViewItem extends StatelessWidget {
  const ProfileViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const ShapeDecoration(shape: RoundedRectangleBorder()),
      child: Row(
        children: [
          Text(
            S.of(context).ProfileViewLanguage,
            style: AppTextStyles.bodyBaseSemibold,
          ),
          const Spacer(),
          Text(
            S.of(context).ProfileViewLanguage_value,
            style: AppTextStyles.bodyBaseSemibold,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileViewLanguagePage.routeName);
              const ProfileViewLanguagePage();
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
