import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub_app/core/helper_functions/get_dummy_product.dart';
import 'package:fruits_hub_app/core/widgets/custom_error_widget.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/fav_products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavProductGridViewBlocBuilder extends StatelessWidget {
  const FavProductGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return FavProductsGridView(products: state.products);
        } else if (state is ProductsFalure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.error),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: FavProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
