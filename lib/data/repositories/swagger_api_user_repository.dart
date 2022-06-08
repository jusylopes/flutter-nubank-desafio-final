import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:projeto_final/data/entity/accreditation/get/get_details.dart';
import 'package:projeto_final/data/entity/accreditation/get/get_user_accreditation.dart';
import 'package:projeto_final/data/entity/accreditation/post/accreditation_entity.dart';
import 'package:projeto_final/data/entity/eventos/get/get_events.dart';
import 'package:projeto_final/data/entity/user/get/get_address_details.dart';
import 'package:projeto_final/data/entity/user/get/get_user_contacts.dart';
import 'package:projeto_final/data/entity/user/get/get_user_details.dart';
import 'package:projeto_final/data/entity/user/patch/patch_address_register.dart';
import 'package:projeto_final/data/entity/user/patch/patch_contacts_register_entity.dart';
import 'package:projeto_final/data/entity/user/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/entity/user/post/register_entity.dart';
import 'package:projeto_final/data/entity/user/post/login_entity.dart';
import 'package:projeto_final/data/repositories/user_repository.dart';
import 'package:projeto_final/external/login_mapper.dart';
import 'package:projeto_final/external/patch_address_register_mapper.dart';
import 'package:projeto_final/external/patch_contacts_register_mapper.dart';
import 'package:projeto_final/external/patch_user_register_mapper.dart';
import 'package:projeto_final/external/register_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SwaggerApiUserRepository implements UserRepository {
  @override
  Future<bool> login(LoginEntity login) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/auth/login');
    var respostaLogin = await http.post(
      url,
      body: LoginMapper.toReplitMap(login),
    );


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
    return user;
  }

  @override
  Future<GetAddressDetails> getAddressDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlUser = Uri.parse('https://cubos-las-api.herokuapp.com/user/address');
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
    return address;
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
    if (respostaPatchUserRegister.statusCode == 200) {
      debugPrint('Patch Register OK');
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
    if (respostaPatchContactsRegister.statusCode == 200) {
      debugPrint('Patch Registro Contacts OK');
      return true;
    } else {
      debugPrint('Deu merda no Patch Contacts');
    }
    return false;
  }

  @override
  Future<List<GetEvent>> getAllEvents() async {
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

    var responseEvents = json.decode(respostaGetAllEvents.body);

    List<GetEvent> events = [];
    for (var json in responseEvents) {
      GetEvent event = GetEvent(
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

  @override
  Future<GetEvent> getSpecificEvent(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlEvents = Uri.parse('https://cubos-las-api.herokuapp.com/events/$id');
    var respostaSpecificEvent = await http.get(
      urlEvents,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    var json = jsonDecode(respostaSpecificEvent.body);

    final event = GetEvent(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
    );
    return event;
  }

  @override
  Future<GetEvent> getStatusEvent(int eventStatus) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlEventStatus = Uri.parse(
        'https://cubos-las-api.herokuapp.com/events/status/$eventStatus');
    var respostaEventStatus = await http.get(
      urlEventStatus,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    var json = jsonDecode(respostaEventStatus.body);

    final status = GetEvent(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
    );

    return status;
  }

  @override
  Future<bool> accreditation(int eventId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var url =
        Uri.parse('https://cubos-las-api.herokuapp.com/accreditation/$eventId');
    var respostaAccreditation = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: {'id': eventId},
    );
    var json = jsonDecode(respostaAccreditation.body);
    if (respostaAccreditation.statusCode == 201) {
      debugPrint('Acredditation Ok');
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<GetUserAccreditation>> getUserAccreditation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlUserAccreditation =
        Uri.parse('https://cubos-las-api.herokuapp.com/accreditation');
    var respostaGetUserAccreditation = await http.get(
      urlUserAccreditation,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final responseEvents = jsonDecode(respostaGetUserAccreditation.body);
    List<GetUserAccreditation> accreditadeds = [];
    for (var json in responseEvents) {
      GetUserAccreditation accreditaded = GetUserAccreditation.fromJson(json);
      accreditadeds.add(accreditaded);
    }
    debugPrint(accreditadeds[12].event?.name);
    return accreditadeds;
  }

  @override
  Future<List<GetAccreditadedDetails>> accreditadedDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var urlAccreditadedDetails =
        Uri.parse('https://cubos-las-api.herokuapp.com/accreditation/2/check');
    var respostaAccreditadedDetails = await http.get(
      urlAccreditadedDetails,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    final responseAccreditadedDetails =
        jsonDecode(respostaAccreditadedDetails.body);
    List<GetAccreditadedDetails> details = [];
    for (var json in responseAccreditadedDetails) {
      GetAccreditadedDetails detail = GetAccreditadedDetails.fromJson(json);
      details.add(detail);
    }
    return details;
  }
}
