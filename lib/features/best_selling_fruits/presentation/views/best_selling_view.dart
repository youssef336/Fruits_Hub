import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';

import '../../../../generated/l10n.dart';
import 'widgets/best_selling_view_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});
  static const String routeName = '/best-selling-fruits';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        context,
        title: S.of(context).Home_Best_Seller_Header,
      ),
      body: SafeArea(child: BestSellingViewBody()),
    );
  }
}
