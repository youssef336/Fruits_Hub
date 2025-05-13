import 'dart:convert';

import 'package:fruits_hub_app/constant.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub_app/features/auth/data/models/user_model.dart';
import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';

UserEntity getUser() {
  // This function returns a UserEntity object with default values.
  var jsonString = Prefs.getString(KUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
