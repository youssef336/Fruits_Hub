import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';

abstract class DatabaseServies {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });
  Future<UserEntity> getUserData({required String path, required String uid});
}
