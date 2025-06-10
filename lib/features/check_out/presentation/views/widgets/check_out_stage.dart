import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/step_item.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../domains/entities/order_entity.dart';

class CheckOutStage extends StatelessWidget {
  const CheckOutStage({
    super.key,
    required this.currentPageindex,
    required this.pageController,
    required this.onTap,
  });
  final int currentPageindex;
  final PageController pageController;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps(context).length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: StepItem(
              isActive: index <= currentPageindex,
              index: (index + 1).toString(),
              text: getSteps(context)[index],
            ),
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
