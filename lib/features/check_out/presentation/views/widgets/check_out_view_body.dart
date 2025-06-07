import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/features/check_out/domains/entities/order_entity.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/check_out_stage.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/l10n.dart';
import 'check_out_steps_page_view.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageindex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckOutStage(
            pageController: pageController,
            currentPageindex: currentPageindex,
          ),

          Expanded(
            child: CheckOutStepsPageView(pageController: pageController),
          ),
          CustomButtom(
            text: getNextButtonText(currentPageindex),
            onPressed: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  currentPageindex + 1,
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
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  String getNextButtonText(int currentPageindex) {
    switch (currentPageindex) {
      case 0:
        return S.of(context).CheckOutView_Next;
      case 1:
        return S.of(context).CheckOutView_Next;
      case 2:
        return S.of(context).CheckOutView_PayWithPayPal;
      default:
        return S.of(context).CheckOutView_Next;
    }
  }
}
