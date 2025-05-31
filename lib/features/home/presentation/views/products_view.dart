import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';

import '../../../../core/cubits/products_cubit.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
      child: ProductsViewBody(),
    );
  }
}
