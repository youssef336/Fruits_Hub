import 'package:flutter/material.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/step_item.dart';

import '../../../../../generated/l10n.dart';

class CheckOutStage extends StatelessWidget {
  const CheckOutStage({super.key, required this.currentPageindex});
  final int currentPageindex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps(context).length, (index) {
        return Expanded(
          child: StepItem(
            isActive: index <= currentPageindex,
            index: (index + 1).toString(),
            text: getSteps(context)[index],
          ),
        );
      }),
    );
  }
}

List<String> getSteps(context) {
  return [
    S.of(context).CheckOutView_title,
    S.of(context).CheckOutView_address,
    S.of(context).CheckOutView_payment,
  ];
}
