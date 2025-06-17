import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../../domain/entities/notification_entity.dart';
import '../../../../domain/repo/notification_repo.dart';

part 'notificationcubit_state.dart';

class NotificationcubitCubit extends Cubit<NotificationcubitState> {
  final NotificationRepo notificationRepo;
  final List<NotificationEntity> notifications = [];
  NotificationcubitCubit(this.notificationRepo)
    : super(NotificationcubitInitial());

  void addNotification() async {
    emit(NotificationcubitLoading());
    var result = await notificationRepo.getNotifications();
    log('result: $result');
    result.fold((failure) => emit(NotificationcubitError(failure.message)), (
      notifications,
    ) {
      emit(NotificationcubitSuccess(notifications));
    });
  }
}
