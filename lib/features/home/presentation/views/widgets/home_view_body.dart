import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/widgets/search_text_feild.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/feature_home_list.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_best_seller_header.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_best_selliing_items.dart';

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
