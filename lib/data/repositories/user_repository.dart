import 'package:projeto_final/data/entity/get/get_address_details.dart';
import 'package:projeto_final/data/entity/get/get_user_contacts.dart';
import 'package:projeto_final/data/entity/get/get_user_details.dart';
import 'package:projeto_final/data/entity/patch/patch_address_register.dart';
import 'package:projeto_final/data/entity/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/entity/register_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';

abstract class UserRepository {
  Future<void> login(LoginEntity login);

  Future<void> register(RegisterEntity register);

  Future<void> patchUserRegister(PatchUserRegisterEntity patchUserRegister);

  Future<void> patchAddressRegister(
      PatchAddressRegisterEntity patchAddressRegister);

  Future<bool> logout();

  Future<GetUserDetails> getUserDetails();

  Future<GetAddressDetails> getAddressDetails();

  Future<GetUserContacts> getUserContacts();
}
