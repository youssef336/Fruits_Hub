import 'package:bloc/bloc.dart';

import '../../../../domain/entities/notification_entity.dart';
import '../../../../domain/repo/notification_repo.dart';

part 'notificationcubit_state.dart';

class NotificationcubitCubit extends Cubit<NotificationcubitState> {
  final NotificationRepo notificationRepo;

  NotificationcubitCubit(this.notificationRepo)
    : super(NotificationcubitInitial());

  void addNotification(NotificationEntity notification) async {
    emit(NotificationcubitLoading());
    var result = await notificationRepo.getNotifications();
    result.fold((failure) => emit(NotificationcubitError(failure.message)), (
      notifications,
    ) {
      notifications.add(notification);
      emit(NotificationcubitSuccess(notifications));
    });
  }
}
