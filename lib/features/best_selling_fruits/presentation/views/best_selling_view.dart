import 'package:flutter/material.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

import 'widgets/best_selling_view_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const String routeName = '/best-selling-fruits';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BestSellingViewBody()));
  }
}
