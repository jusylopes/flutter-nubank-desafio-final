import 'package:projeto_final/data/entity/get_user_entity.dart';
import 'package:projeto_final/data/entity/register_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/external/swagger_api_user_repository.dart';

abstract class UserRepository {
  // Future<UserEntity?> get user;
  // Future<List<DetailsUserEntity>> getDetailsUser();

  Future<Todo> getDetailsUser();

  Future<void> login(LoginEntity login);

  Future<void> register(RegisterEntity register);

  Future<bool> logout();
}
