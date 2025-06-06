import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/widgets/custom_buttom.dart';
import 'package:fruits_hub_app/features/check_out/presentation/views/widgets/check_out_stage.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CheckOutStage(),

          Expanded(
            child: CheckOutStepsPageView(pageController: pageController),
          ),
          CustomButtom(
            text: S.of(context).CheckOutView_Next,
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
