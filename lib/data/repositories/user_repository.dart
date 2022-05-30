import 'package:projeto_final/data/entity/user_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';

abstract class UserRepository {
  // Future<UserEntity?> get user;
  // Future<List<DetailsUserEntity>> getDetailsUser();

  Future<void> getDetailsUser();

  Future<void> login(LoginEntity login);

  Future<void> register(UserEntity credentials);

  Future<bool> logout();
}
