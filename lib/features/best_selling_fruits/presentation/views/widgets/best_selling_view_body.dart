import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/feature_home_list.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_best_seller_header.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/product_grid_view_bloc_builder.dart';

import '../../../../../constant.dart';
import '../../../../../core/cubits/products_cubit.dart';
import '../../../../../core/widgets/search_text_feild.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProductsMoreLimit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KhorzontalPadding),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [ProductGridViewBlocBuilder()],
      ),
    );
  }
}
