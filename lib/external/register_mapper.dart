import 'package:projeto_final/data/entity/register_entity.dart';

class RegisterMapper {
  static Map<String, dynamic> toReplitMap(RegisterEntity register) {
    return {
      "fullName": register.fullName,
      "cpf": register.cpf,
      "email": register.email,
      "password": register.password,
    };
  }
}
