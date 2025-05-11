import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_custom_bottom_navigation_bar.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeCustomBottomNavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
