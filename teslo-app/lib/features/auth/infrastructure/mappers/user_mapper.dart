import 'package:teslo_shop/features/auth/domain/entities/user_entity.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      roles: List<String>.from(json['roles'].map((role) => role)),
      token: json['token']);
}
