import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/fruite_item.dart';

class HomeBestSelliingItems extends StatelessWidget {
  const HomeBestSelliingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return const FruiteItem();
      },
    );
  }
}
