import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub_app/core/helper_functions/get_dummy_product.dart';
import 'package:fruits_hub_app/core/widgets/custom_error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'products_grid_view.dart';

class ProductGridViewBlocBuilder extends StatelessWidget {
  const ProductGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductsFalure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.error),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
