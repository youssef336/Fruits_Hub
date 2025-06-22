import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/profile_view_fav_page.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/profile_view_item.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/profile_view_logout.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';
import 'package:fruits_hub_app/core/widgets/build_app_bar.dart';
import '../../../../../../constant.dart';
import 'custom_home_appbar.dart';
import 'profile_viewLanguage_page.dart';
import 'profile_view_avtar_page.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  Future<void> _showLogoutDialog() async {
    await ProfileViewLogout.showLogoutDialog(context);
  }

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
                ProfileViewItem(
                  headText: S.of(context).ProfileViewLanguage,
                  icon: Icons.language_outlined,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ProfileViewLanguagePage.routeName,
                    );
                  },
                ),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                ProfileViewItem(
                  headText: S.of(context).ProfileViewProfileImage,
                  icon: Icons.person_outline_outlined,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ProfileViewAvtarPage.routeName,
                    );
                  },
                ),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                ProfileViewItem(
                  headText: S.of(context).ProfileViewFavourites,
                  icon: Icons.favorite_outline_outlined,
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileViewFavPage.routeName);
                  },
                ),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                ProfileViewItem(
                  headText: S.of(context).ProfileViewLogout,
                  icon: Icons.logout_outlined,
                  onPressed: () => _showLogoutDialog(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
