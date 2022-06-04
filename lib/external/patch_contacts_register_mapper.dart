import 'package:projeto_final/data/entity/user/patch/patch_contacts_register_entity.dart';

class PatchContactsRegisterMapper {
  static Map<String, dynamic> toReplitMap(
      PatchContactsRegisterEntity patchContactsRegister) {
    return {
      // "email": patchContactsRegister.email,
      "phone": patchContactsRegister.phone,
      // "mobilePhone": patchContactsRegister.mobilePhone,
    };
  }
}
