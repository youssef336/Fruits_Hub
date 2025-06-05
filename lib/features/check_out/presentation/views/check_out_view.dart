import 'package:flutter/material.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

import '../../../../core/widgets/build_app_bar.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});
  static const String routeName = '/CheckOutView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        context,
        title: S.of(context).CheckOutView_title,
        showNotification: false,
      ),
      body: const CheckOutViewBody(),
    );
  }
}
