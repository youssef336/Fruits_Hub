import 'package:flutter/material.dart';
import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';

class ShipinngItem extends StatelessWidget {
  const ShipinngItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });
  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),

          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? KprimaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShipinngItemDot()
                  : const InActiveShipinngItemDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.cairoRegular.copyWith(
                      height: 1.70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.cairoRegular.copyWith(
                      height: 1.60,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppTextStyles.bodysmallBold.copyWith(
                    color: KprimaryColorLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShipinngItemDot extends StatelessWidget {
  const InActiveShipinngItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
    );
  }
}

class ActiveShipinngItemDot extends StatelessWidget {
  const ActiveShipinngItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: Color(0xFF1B5E37) /* Green1-500 */,
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
