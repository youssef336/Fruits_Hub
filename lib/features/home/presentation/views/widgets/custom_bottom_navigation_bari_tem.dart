import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/features/home/domain/entities/button_navigation_bar_entity.dart';

import 'home_active_item.dart';
import 'home_in_active_item.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.isSelected,
    required this.buttonNavigationBarEntity,
  });

  final bool isSelected;
  final ButtonNavigationBarEntity buttonNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
          text: buttonNavigationBarEntity.name,
          image: buttonNavigationBarEntity.activeImagePath,
        )
        : InActiveItem(imagePath: buttonNavigationBarEntity.inactiveImagePath);
  }
}
