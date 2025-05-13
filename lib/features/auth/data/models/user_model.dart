import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.email});

  factory UserModel.fromFireabaseUser(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
    );
  }

  toMap() {
    return {'id': id, 'name': name, 'email': email};
  }
}
