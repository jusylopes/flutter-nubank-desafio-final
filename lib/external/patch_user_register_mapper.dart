import 'package:projeto_final/data/entity/patch/patch_user_register_entity.dart';

class PatchUserRegisterMapper {
  static Map<String, dynamic> toReplitMap(
      PatchUserRegisterEntity patchUserRegister) {
    return {
      "fullName": patchUserRegister.fullName,
       "rg": patchUserRegister.rg,
      "cpf": patchUserRegister.cpf,
      "email": patchUserRegister.email,
      // "profilePictureUrl": patchRegister.profilePictureUrl,
     // "birthDate": patchUserRegister.birthDate,
    };
  }
}
