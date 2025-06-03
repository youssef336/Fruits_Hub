import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/home_custom_bottom_navigation_bar.dart';

import 'widgets/main_view_body_bloc_listener.dart';

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
    return Scaffold(
      bottomNavigationBar: HomeCustomBottomNavigationBar(
        onItemTapped: (int value) {
          currentViewIndex = value;
          setState(() {});
        },
      ),
      body: MainViewBodyBlocListener(currentViewIndex: currentViewIndex),
    );
  }
}
