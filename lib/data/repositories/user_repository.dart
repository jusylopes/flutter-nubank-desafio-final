
import 'package:projeto_final/data/entity/credentials_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/data/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> get user;

  Future<void> login(LoginEntity login);

  Future<void> register(CredentialsEntity credentials);

  Future<bool> logout();
}