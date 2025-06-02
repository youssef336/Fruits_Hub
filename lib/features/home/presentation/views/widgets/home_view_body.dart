import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../../../../core/cubits/products_cubit.dart';
import '../../../../../core/widgets/search_text_feild.dart';
import 'custom_home_appbar.dart';
import 'feature_home_list.dart';
import 'home_best_seller_header.dart';
import 'product_grid_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: KhorzontalPadding),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
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
          ProductGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
