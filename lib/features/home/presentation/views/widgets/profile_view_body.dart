import 'package:flutter/material.dart';
import 'package:fruits_hub_app/main.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/build_app_bar.dart';
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
                  title: isArabic() ? ' حسابي' : 'Profile',
                  showBackButton: false,
                  showNotification: false,
                ),
                const CustomHomeAppBar(showNotification: false),
                const SizedBox(height: KTopPadding),
                Text(
                  isArabic() ? 'عام' : 'General',
                  style: AppTextStyles.cairoBold.copyWith(height: 1.70),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(),
                  ),
                  child: Row(
                    children: [
                      Text(
                        isArabic() ? 'اللغة' : 'Language',
                        style: AppTextStyles.bodyBaseSemibold,
                      ),
                      const Spacer(),
                      Text(
                        isArabic() ? 'العربية' : 'English',
                        style: AppTextStyles.bodyBaseSemibold,
                      ),
                      IconButton(
                        onPressed: () {
                          isArabic() ? 'en' : 'ar';
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
