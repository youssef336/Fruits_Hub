import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_custom_bottom_navigation_bar.dart';

import 'widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeCustomBottomNavigationBar(
        onItemTapped: (int value) {},
      ),
      body: SafeArea(child: HomeView()),
    );
  }
}
