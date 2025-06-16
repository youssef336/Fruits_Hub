part of 'notificationcubit_cubit.dart';

abstract class NotificationcubitState {
  const NotificationcubitState();
}

class NotificationcubitInitial extends NotificationcubitState {}

class NotificationcubitSuccess extends NotificationcubitState {
  final List<NotificationEntity> notifications;
  NotificationcubitSuccess(this.notifications);
}

class NotificationcubitError extends NotificationcubitState {
  final String message;
  NotificationcubitError(this.message);
}

class NotificationcubitLoading extends NotificationcubitState {}
