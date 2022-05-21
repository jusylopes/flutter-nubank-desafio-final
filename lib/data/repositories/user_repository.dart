
import 'package:projeto_final/data/entity/credentials_entity.dart';
import 'package:projeto_final/data/entity/user_entity.dart';

abstract class UserRepository {
  Future<void> login(CredentialsEntity credentials);
  Future<void> register(CredentialsEntity credentialsEntity);
  Future<UserEntity?> get user;
  Future<void> logout();
}
