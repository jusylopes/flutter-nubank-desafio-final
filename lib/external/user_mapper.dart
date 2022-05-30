import 'package:projeto_final/data/entity/user_entity.dart';

class UserMapper {
  static Map<String, dynamic> toReplitMap(UserEntity user) {
    return {
      "fullName": user.fullName,
      "rg": user.rg,
      "cpf": user.cpf,
      "email": user.email,
      "password": user.password,
      "profilePictureUrl": user.profilePictureUrl,
      "birthDate": user.birthDate,
    };
  }
}
