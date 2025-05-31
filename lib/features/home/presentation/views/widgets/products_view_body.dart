import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/Prodeuct_view_header.dart';

import '../../../../../constant.dart';
import '../../../../../core/cubits/products_cubit.dart';
import '../../../../../core/widgets/search_text_feild.dart';
import 'custom_home_appbar.dart';

import 'product_grid_view_bloc_builder.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

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

                ProductViewHeader(
                  productLength: context.read<ProductsCubit>().productsLength,
                ),
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
