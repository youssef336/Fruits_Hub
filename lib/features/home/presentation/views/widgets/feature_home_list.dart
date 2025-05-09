import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/home/presentation/views/widgets/feature_home_item.dart';

class FeatureHomeList extends StatelessWidget {
  const FeatureHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: const FeatureHomeItem(),
          ),
        ),
      ),
    );
  }
}
