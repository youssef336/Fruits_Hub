import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/Product_view_header.dart';
import '../../../../../constant.dart';
import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../../core/widgets/search_text_feild.dart';

import '../../../../../generated/l10n.dart';
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
    context.read<ProductsCubit>().productsLength;

    super.initState();
  }

  @override
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
                buildAppbar(
                  context,
                  title: S.of(context).Products_view_title,
                  showBackButton: false,
                ),
                const SizedBox(height: KTopPadding),
                const SearchTextFeild(),
                const SizedBox(height: 12),

                // Use BlocBuilder here
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return ProductViewHeader(
                      productLength:
                          state is ProductsSuccess ? state.products.length : 0,
                    );
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const ProductGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
