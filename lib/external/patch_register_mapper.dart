import 'package:projeto_final/data/entity/patch/patch_register_entity.dart';

class PatchRegisterMapper {
  static Map<String, dynamic> toReplitMap(PatchRegisterEntity patchRegister) {
    return {
      "fullName": patchRegister.fullName,
      "rg": patchRegister.rg,
      "cpf": patchRegister.cpf,
      "email": patchRegister.email,
      "profilePictureUrl": patchRegister.profilePictureUrl,
      "birthDate": patchRegister.birthDate,
    };
  }
}
