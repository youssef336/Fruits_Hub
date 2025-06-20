import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub_app/core/helper_functions/get_dummy_product.dart';
import 'package:fruits_hub_app/core/widgets/custom_error_widget.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/fav_products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavProductGridViewBlocBuilder extends StatefulWidget {
  const FavProductGridViewBlocBuilder({super.key});

  @override
  State<FavProductGridViewBlocBuilder> createState() =>
      _FavProductGridViewBlocBuilderState();
}

class _FavProductGridViewBlocBuilderState
    extends State<FavProductGridViewBlocBuilder> {
  @override
  void initState() {
    // Pass the context to initialize favorites
    context.read<ProductsCubit>().getProducts(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return FavProductsGridView(products: state.products);
        } else if (state is ProductsFalure) {
          return CustomErrorWidget(text: state.error);
        } else {
          return Skeletonizer(
            enabled: true,
            child: FavProductsGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
