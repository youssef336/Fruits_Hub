import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub_app/features/home/presentation/views/widgets/product_grid_view_bloc_builder.dart';

import '../../../../../constant.dart';
import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';

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
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 8),
              child: Text(
                S.of(context).top_selling,

                style: AppTextStyles.cairoBold.copyWith(fontSize: 16),
              ),
            ),
          ),
          const ProductGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
