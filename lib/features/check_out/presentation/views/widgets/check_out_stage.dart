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
  });
  final int currentPageindex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps(context).length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                );
              } else {
                showErrorBar(
                  context,
                  S.of(context).CheckOutView_Shipinng_Error,
                );
              }
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
