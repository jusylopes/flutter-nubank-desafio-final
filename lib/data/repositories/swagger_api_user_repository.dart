import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_final/data/entity/eventos/get/get_all_events.dart';
import 'package:projeto_final/data/entity/user/get/get_address_details.dart';
import 'package:projeto_final/data/entity/user/get/get_user_contacts.dart';
import 'package:projeto_final/data/entity/user/get/get_user_details.dart';
import 'package:projeto_final/data/entity/user/patch/patch_address_register.dart';
import 'package:projeto_final/data/entity/user/patch/patch_contacts_register_entity.dart';
import 'package:projeto_final/data/entity/user/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/entity/user/post/login_entity.dart';
import 'package:projeto_final/data/entity/user/post/register_entity.dart';
import 'package:projeto_final/data/erros/usuario_nao_autorizado_erro.dart';
import 'package:projeto_final/data/repositories/user_repository.dart';
import 'package:projeto_final/external/login_mapper.dart';
import 'package:projeto_final/external/patch_address_register_mapper.dart';
import 'package:projeto_final/external/patch_contacts_register_mapper.dart';
import 'package:projeto_final/external/patch_user_register_mapper.dart';
import 'package:projeto_final/external/register_mapper.dart';

import 'package:shared_preferences/shared_preferences.dart';


// 

class SwaggerApiUserRepository implements UserRepository {
  @override
  Future<bool> login(LoginEntity login) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/auth/login');
    var respostaLogin = await http.post(
      url,
      body: LoginMapper.toReplitMap(login),
    );
    if (respostaLogin.statusCode == 401) {
      throw UsuarioNaoAutorizado('Email ou senha incorreta');
    }
    if (respostaLogin.statusCode == 404) {
      throw UsuarioNaoAutorizado(BaseErrorMessenger.Http_404('pagina'));
    }
    if (respostaLogin.statusCode == 201) {
      await sharedPreferences.setString(
          'token', '${jsonDecode(respostaLogin.body)["token"]}');
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }

  @override
  Future<bool> register(RegisterEntity register) async {
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/user');

    var respostaRegister = await http.post(
      url,
      body: RegisterMapper.toReplitMap(register),
    );
    if (respostaRegister.statusCode == 400) {
      throw (BaseErrorMessenger.Http_400('Má requisição'));
    }
    if (respostaRegister.statusCode == 409) {
      throw (BaseErrorMessenger.Http_409('Email ou CPF já cadastrado'));
    }

    if (respostaRegister.statusCode == 201) {
      debugPrint('Registro OK');
      return true;
    } else {
      debugPrint('Erro - Register Entity');
    }
    return false;
  }

  @override
  Future<GetUserDetails> getUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlUser = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    var respostaGetUser = await http.get(
      urlUser,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    switch (respostaGetUser.statusCode) {
      case 401:
        throw UsuarioNaoAutorizado('Não autorizado');

      default:
        break;
    }
    final json = jsonDecode(respostaGetUser.body);
    final user = GetUserDetails(
      id: json['id'],
      fullName: json['fullName'],
      rg: json['rg'],
      cpf: json['cpf'],
      profilePictureUrl: json['profilePictureUrl'],
      birthDate: json['birthDate'],
      createdAt: json['createdAt'],
    );

    debugPrint('Usuario encontrado');

    return user;
  }

  @override
  Future<GetAddressDetails> getAddressDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      var token = sharedPreferences.getString('token');
      var urlUser =
          Uri.parse('https://cubos-las-api.herokuapp.com/user/address');
      var respostaGetDetails = await http.get(
        urlUser,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      final json = jsonDecode(respostaGetDetails.body);
      final address = GetAddressDetails(
        cep: json['cep'],
        street: json['street'],
        number: json['number'],
        complement: json['complement'],
        district: json['district'],
        city: json['city'],
        state: json['state'],
      );
      // print(json);
      return address;
    } catch (e) {
      throw UsuarioNaoAutorizado('Não Autorizado');
    }
  }

  @override
  Future<GetUserContacts> getUserContacts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlUser =
        Uri.parse('https://cubos-las-api.herokuapp.com/user/contacts');
    var respostaGetContacts = await http.get(
      urlUser,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    switch (respostaGetContacts.statusCode) {
      case 401:
        throw UsuarioNaoAutorizado('Não autorizado');

      default:
        break;
    }

    final json = jsonDecode(respostaGetContacts.body);
    final contacts = GetUserContacts(
      email: json['email'],
      phone: json['phone'],
      mobilePhone: json['mobilePhone'],
    );
    return contacts;
  }

  @override
  Future<bool> patchUserRegister(
      PatchUserRegisterEntity patchUserRegister) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    var respostaPatchUserRegister = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: PatchUserRegisterMapper.toReplitMap(patchUserRegister),
    );
    if (respostaPatchUserRegister.statusCode == 401) {
      throw (BaseErrorMessenger.Http_401('Não Autorizado'));
    }

    if (respostaPatchUserRegister.statusCode == 400) {
      throw (BaseErrorMessenger.Http_400('Má requisição'));
    }
    if (respostaPatchUserRegister.statusCode == 409) {
      throw (BaseErrorMessenger.Http_409('Email ou CPF já cadastrado'));
    }

    if (respostaPatchUserRegister.statusCode == 200) {
      debugPrint('Atualizado com sucesso');
      return true;
    } else {
      debugPrint('Deu erro no Patch Register');
    }
    return false;
  }

  @override
  Future<bool> patchAddressRegister(
      PatchAddressRegisterEntity patchAddressRegister) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/user/address');
    var respostaPatchAddressRegister = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: PatchAddressRegisterMapper.toReplitMap(patchAddressRegister),
    );
    if (respostaPatchAddressRegister.statusCode == 401) {
      throw (BaseErrorMessenger.Http_401('Não Autorizado'));
    }

    if (respostaPatchAddressRegister.statusCode == 400) {
      throw (BaseErrorMessenger.Http_400('Má requisição'));
    }

    if (respostaPatchAddressRegister.statusCode == 200) {
      debugPrint('Patch Address OK');
      return true;
    } else {
      debugPrint('Deu erro no Patch Address');
    }
    return false;
  }

  @override
  Future<bool> patchContactsRegister(
      PatchContactsRegisterEntity patchContactsRegister) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/user/contacts');
    var respostaPatchContactsRegister = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: PatchContactsRegisterMapper.toReplitMap(patchContactsRegister),
    );
    if (respostaPatchContactsRegister.statusCode == 401) {
      throw (BaseErrorMessenger.Http_401('Não Autorizado'));
    }

    if (respostaPatchContactsRegister.statusCode == 400) {
      throw (BaseErrorMessenger.Http_400('Má requisição'));
    }

    if (respostaPatchContactsRegister.statusCode == 409) {
      throw (AdressErrorMessenger.Http_409('Email já cadastrado'));
    }

    if (respostaPatchContactsRegister.statusCode == 200) {
      debugPrint('Contatos atualizados com sucesso');
      return true;
    } else {
      debugPrint('Deu merda no Patch Contacts');
    }
    return false;
  }

  @override
  Future<List<GetAllEvents>> getAllEvents() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlEvents = Uri.parse('https://cubos-las-api.herokuapp.com/events');
    var respostaGetAllEvents = await http.get(
      urlEvents,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    switch (respostaGetAllEvents.statusCode) {
      case 401:
        throw UsuarioNaoAutorizado('Não autorizado');

      default:
        break;
    }

    var responseEvents = json.decode(respostaGetAllEvents.body);

    List<GetAllEvents> events = [];
    for (var json in responseEvents) {
      GetAllEvents event = GetAllEvents(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        status: json['status'],
      );
      events.add(event);
    }
    return events;
  }
}
   //foi retirado da pasta de teste, pode excluir
// class ReturnHistory {
//   Future<List<AcredHistory>> getAcredHistory() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString('token');
//     var urlaccreditation =
//         Uri.parse('https://cubos-las-api.herokuapp.com/accreditation');
//     var respostaAcredHistory = await http.get(
//       urlaccreditation,
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer $token',
//       },
//     );
//     if (respostaAcredHistory.statusCode == 401) {
//       throw (BaseErrorMessenger.Http_401('Não Autorizado'));
//     }
//     if (respostaAcredHistory.statusCode == 404) {
//       throw (AcreditationIdErrorMessenger.Http_404(
//           'O usuário não tem eventos credenciados com o ID fornecido'));
//     }

//     var responseaccreditation = json.decode(respostaAcredHistory.body);

//     List<AcredHistory> accreditation = [];

//     for (Map<String, dynamic> map in responseaccreditation) {
//       AcredHistory r = AcredHistory.fromJson(map);
//       accreditation.add(r);
//     }

//     return accreditation;
//   }
// }
