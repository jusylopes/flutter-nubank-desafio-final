import 'package:projeto_final/data/entity/user/patch/patch_address_register.dart';

class PatchAddressRegisterMapper {
  static Map<String, dynamic> toReplitMap(
      PatchAddressRegisterEntity patchAddressRegister) {
    return {
      // "cep": patchAddressRegister.cep,
      // "street": patchAddressRegister.street,
      "number": patchAddressRegister.number,
      // "complement": patchAddressRegister.complement,
      // "district": patchAddressRegister.district,
      // "city": patchAddressRegister.city,
      // "state": patchAddressRegister.state,
    };
  }
}
