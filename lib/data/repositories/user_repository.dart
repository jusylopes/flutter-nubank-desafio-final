import 'package:projeto_final/data/entity/accreditation/get/get_details.dart';
import 'package:projeto_final/data/entity/accreditation/get/get_user_accreditation.dart';
import 'package:projeto_final/data/entity/eventos/get/get_events.dart';
import 'package:projeto_final/data/entity/user/get/get_address_details.dart';
import 'package:projeto_final/data/entity/user/get/get_user_contacts.dart';
import 'package:projeto_final/data/entity/user/get/get_user_details.dart';
import 'package:projeto_final/data/entity/user/patch/patch_address_register.dart';
import 'package:projeto_final/data/entity/user/patch/patch_contacts_register_entity.dart';
import 'package:projeto_final/data/entity/user/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/entity/user/post/register_entity.dart';
import 'package:projeto_final/data/entity/user/post/login_entity.dart';

abstract class UserRepository {
  Future<void> login(LoginEntity login);

  Future<void> register(RegisterEntity register);

  Future<void> patchUserRegister(PatchUserRegisterEntity patchUserRegister);

  Future<void> patchAddressRegister(
      PatchAddressRegisterEntity patchAddressRegister);

  Future<void> patchContactsRegister(
      PatchContactsRegisterEntity patchContactsRegister);

  Future<bool> logout();

  Future<GetUserDetails> getUserDetails();

  Future<GetAddressDetails> getAddressDetails();

  Future<GetUserContacts> getUserContacts();

  Future<List<GetEvent>> getAllEvents();

  Future<GetEvent> getSpecificEvent(int id);

  Future<GetEvent> getStatusEvent(int eventStatus);

  Future<bool> accreditation(int eventId);

  Future<List<GetUserAccreditation>> getUserAccreditation();

  Future<List<GetAccreditadedDetails>> accreditadedDetails();
}
