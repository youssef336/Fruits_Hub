import 'package:fruits_hub_app/features/home/presentation/views/widgets/fav_product_grid_view_bloc_builder.dart';
// ignore: unused_import
import 'package:fruits_hub_app/features/home/presentation/views/widgets/fav_products_grid_view.dart';
import 'package:flutter/material.dart';

class ProfileViewFavPageBody extends StatelessWidget {
  const ProfileViewFavPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverFillRemaining(
          hasScrollBody: true,
          child: FavProductGridViewBlocBuilder(),
        ),
      ],
    );
  }
}
