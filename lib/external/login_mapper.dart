import 'package:projeto_final/data/entity/user/post/login_entity.dart';

class LoginMapper {
  static Map<String, dynamic> toReplitMap(LoginEntity entity) {
    return {
      'cpf': entity.cpf,
      'password': entity.password,
    };
  }
}