import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fruits_hub_app/main.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/build_app_bar.dart';
import '../../../../../generated/l10n.dart';
import 'custom_home_appbar.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppbar(
                  context,
                  title: S.of(context).Home_view_welcome_appbar,
                  showBackButton: false,
                  showNotification: false,
                ),
                const CustomHomeAppBar(showNotification: false),
                const SizedBox(height: KTopPadding),
                Text(
                  S.of(context).Home_view_welcome_appbar,
                  style: AppTextStyles.cairoBold.copyWith(height: 1.70),
                ),
                const SizedBox(height: 16),
                const ProfileViewItem(),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
          const Text("d", style: AppTextStyles.bodyBaseSemibold),
          const Spacer(),
          const Text("d", style: AppTextStyles.bodyBaseSemibold),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileViewLanguage.routeName);
              const ProfileViewLanguage();
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}

class ProfileViewLanguage extends StatefulWidget {
  const ProfileViewLanguage({super.key});
  static const String routeName = '/ProfileViewLanguage';

  @override
  State<ProfileViewLanguage> createState() => _ProfileViewLanguageState();
}

class _ProfileViewLanguageState extends State<ProfileViewLanguage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(
          context,
          title: S.of(context).on_Login_login,
          showNotification: false,
        ),
        body: Column(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.language),
              label: const Text('Change Language'),
            ),
          ],
        ),
      ),
    );
  }
}
