import 'package:projeto_final/data/entity/get/get_address_details.dart';
import 'package:projeto_final/data/entity/get/get_user_contacts.dart';
import 'package:projeto_final/data/entity/get/get_user_details.dart';
import 'package:projeto_final/data/entity/patch/patch_register_entity.dart';
import 'package:projeto_final/data/entity/register_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';

abstract class UserRepository {
  Future<void> login(LoginEntity login);

  Future<void> register(RegisterEntity register);

  Future<void> patchRegister(PatchRegisterEntity patchRegister);

  Future<bool> logout();

  Future<GetUserDetails> getUserDetails();

  Future<GetAddressDetails> getAddressDetails();

  Future<GetUserContacts> getUserContacts();
}

