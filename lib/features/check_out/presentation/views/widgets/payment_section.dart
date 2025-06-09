import 'package:flutter/material.dart';

import 'address_summary_widget.dart';
import 'order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const OrderSummaryWidget(),
        const SizedBox(height: 16),
        AddressSummaryWidget(pageController: pageController),
      ],
    );
  }
}
