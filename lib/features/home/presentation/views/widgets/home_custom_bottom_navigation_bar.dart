import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/features/home/domain/entities/button_navigation_bar_entity.dart';

import 'custom_bottom_navigation_bari_tem.dart';

class HomeCustomBottomNavigationBar extends StatelessWidget {
  const HomeCustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children:
            getButtonNavigationBarItems(context).map((e) {
              return CustomBottomNavigationBarItem(
                buttonNavigationBarEntity: e,
                isSelected: false,
              );
            }).toList(),
      ),
    );
  }
}





//                           fontSize: 13,