import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/custom_home_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [SliverToBoxAdapter(child: CustomHomeAppBar())],
    );
  }
}
