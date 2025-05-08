import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';

abstract class DatabaseServies {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });
  Future<bool> checkifDataExists({
    required String path,
    required String documentId,
  });
}
