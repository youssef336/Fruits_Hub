import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/fav_product_grid_view_bloc_builder.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/fav_products_grid_view.dart';

class ProfileViewFavPageBody extends StatelessWidget {
  const ProfileViewFavPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16),
          SizedBox(height: 300, child: FavProductGridViewBlocBuilder()),
        ],
      ),
    );
  }
}
