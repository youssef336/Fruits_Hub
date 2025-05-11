import 'package:fruits_hub_app/core/utils/app_images.dart';
import 'package:fruits_hub_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class ButtonNavigationBarEntity {
  final String activeImagePath;
  final String inactiveImagePath;
  final String name;

  ButtonNavigationBarEntity({
    required this.activeImagePath,
    required this.inactiveImagePath,
    required this.name,
  });
}

List<ButtonNavigationBarEntity> getButtonNavigationBarItems(
  BuildContext context,
) {
  return [
    ButtonNavigationBarEntity(
      activeImagePath: Assets.imagesVuesaxBoldHome,
      inactiveImagePath: Assets.imagesVuesaxOutlineHome,
      name: S.of(context).Button_NavigationBar_Entity_Home,
    ),
    ButtonNavigationBarEntity(
      activeImagePath: Assets.imagesVuesaxBoldProducts,
      inactiveImagePath: Assets.imagesVuesaxOutlineProducts,
      name: S.of(context).Button_NavigationBar_Entity_Products,
    ),
    ButtonNavigationBarEntity(
      activeImagePath: Assets.imagesVuesaxBoldShoppingCart,
      inactiveImagePath: Assets.imagesVuesaxOutlineShoppingCart,
      name: S.of(context).Button_NavigationBar_Entity_Cart,
    ),
    ButtonNavigationBarEntity(
      activeImagePath: Assets.imagesVuesaxBoldUser,
      inactiveImagePath: Assets.imagesVuesaxOutlineUser,
      name: S.of(context).Button_NavigationBar_Entity_Profile,
    ),
  ];
}
