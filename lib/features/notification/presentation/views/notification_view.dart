import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub_app/features/notification/presentation/views/widgets/notification_view_body.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helper_functions/build_error_bar.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../manager/cubits/notificationcubit/notificationcubit_cubit.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = '/notification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        showNotification: false,
        context,
        title: S.of(context).NotificationHeader_appbar,
      ),

      body: const NotificationViewBodyBlockBuilder(),
    );
  }
}

class NotificationViewBodyBlockBuilder extends StatelessWidget {
  const NotificationViewBodyBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationcubitCubit, NotificationcubitState>(
      listener: (context, state) {
        if (state is NotificationcubitError) {
          showErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is NotificationcubitSuccess) {
          return NotificationViewBody(notifications: state.notifications);
        }

        // Show empty data or placeholder instead of error
        return ModalProgressHUD(
          inAsyncCall: state is NotificationcubitLoading ? true : false,
          child: const NotificationViewBody(notifications: []),
        );
      },
    );
  }
}
