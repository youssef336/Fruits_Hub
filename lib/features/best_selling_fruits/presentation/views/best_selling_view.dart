import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart_cubit.dart';

import '../../../../core/helper_functions/build_error_bar.dart';
import '../../../../core/widgets/build_app_bar.dart';

import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import 'widgets/best_selling_view_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const String routeName = '/best-selling-fruits';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        context,
        title: S.of(context).Home_Best_Seller_Header,
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
          child: const BestSellingViewBody(),
        ),
      ),
    );
  }
}
