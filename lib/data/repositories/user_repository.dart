import 'package:projeto_final/data/entity/get_user_entity.dart';
import 'package:projeto_final/data/entity/register_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';

abstract class UserRepository {
  Future<GetUserEntity> getDetailsUser();

  Future<void> login(LoginEntity login);

  Future<void> register(RegisterEntity register);

  Future<bool> logout();
}
