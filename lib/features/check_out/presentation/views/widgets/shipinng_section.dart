import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'shipinng_item.dart';

class ShipinngSection extends StatefulWidget {
  const ShipinngSection({super.key});

  @override
  State<ShipinngSection> createState() => _ShipinngSectionState();
}

class _ShipinngSectionState extends State<ShipinngSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 33),
        ShipinngItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          isSelected: selectedIndex == 0,
          title: S.of(context).CheckOutView_Shipinng_title1,
          subTitle: S.of(context).CheckOutView_Shipinng_Subtitle1,
          price: '40 جنيه',
        ),
        const SizedBox(height: 16),
        ShipinngItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          title: S.of(context).CheckOutView_Shipinng_title2,
          subTitle: S.of(context).CheckOutView_Shipinng_Subtitle2,
          price: 'مجانا',
        ),
      ],
    );
  }
}
