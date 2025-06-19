import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';

import 'package:fruits_hub_app/constant.dart';
import '../../../../domain/entities/notification_entity.dart';
import '../../../../domain/repo/notification_repo.dart';

part 'notificationcubit_state.dart';

class NotificationcubitCubit extends Cubit<NotificationcubitState> {
  final NotificationRepo notificationRepo;
  final List<NotificationEntity> notifications = [];
  
  NotificationcubitCubit(this.notificationRepo)
    : super(NotificationcubitInitial()) {
    // Initialize with current notifications
    addNotification();
  }

  Future<void> addNotification() async {
    emit(NotificationcubitLoading());
    var result = await notificationRepo.getNotifications();
    log('result: $result');
    
    result.fold(
      (failure) => emit(NotificationcubitError(failure.message)),
      (notifications) {
        // Calculate unread count
        final unreadCount = notifications.where((n) => !n.isRead).length;
        // Update the shared preferences
        Prefs.setInt(Knotification, unreadCount);
        
        emit(NotificationcubitSuccess(notifications));
      },
    );
  }
  
  // Call this when a notification is marked as read
  void markAsRead() {
    final currentState = state;
    if (currentState is NotificationcubitSuccess) {
      final unreadCount = Prefs.getInt(Knotification) ?? 0;
      if (unreadCount > 0) {
        Prefs.setInt(Knotification, unreadCount - 1);
      }
    }
  }
}
