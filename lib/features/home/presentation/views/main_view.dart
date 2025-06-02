import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/home/presentation/manager/cubits/cart_cubit.dart';
import 'package:fruits_hub_app/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub_app/features/home/presentation/views/products_view.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_custom_bottom_navigation_bar.dart';

import 'widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = '/home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: HomeCustomBottomNavigationBar(
          onItemTapped: (int value) {
            currentViewIndex = value;
            setState(() {});
          },
        ),
        body: SafeArea(
          child: IndexedStack(
            index: currentViewIndex,
            children: [
              const HomeView(),
              const ProductsView(),
              const CartView(),
            ],
          ),
        ),
      ),
    );
  }
}
