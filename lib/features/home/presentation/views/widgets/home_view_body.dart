import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/search_text_feild.dart';
import 'custom_home_appbar.dart';
import 'feature_home_list.dart';
import 'home_best_seller_header.dart';
import 'home_best_selliing_items.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                SizedBox(height: KTopPadding),
                SearchTextFeild(),
                SizedBox(height: 12),
                FeatureHomeList(),
                SizedBox(height: 12),
                HomeBestSellerHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          HomeBestSelliingItems(),
        ],
      ),
    );
  }
}
