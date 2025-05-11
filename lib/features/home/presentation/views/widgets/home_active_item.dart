import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.ActiveimagePath});
  final String ActiveimagePath;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: SvgPicture.asset(ActiveimagePath));
  }
}
