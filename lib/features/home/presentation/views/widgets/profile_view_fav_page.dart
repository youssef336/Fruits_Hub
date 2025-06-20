import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_app/core/services/get_it_service.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/profile_view_fav_page_body.dart';

class ProfileViewFavPage extends StatelessWidget {
  const ProfileViewFavPage({super.key});
  static const String routeName = '/ProfileViewFavPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
        child: const ProfileViewFavPageBody(),
      ),
    );
  }
}
