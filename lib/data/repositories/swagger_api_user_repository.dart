import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:projeto_final/data/entity/get/get_address_details.dart';
import 'package:projeto_final/data/entity/get/get_user_contacts.dart';
import 'package:projeto_final/data/entity/get/get_user_details.dart';
import 'package:projeto_final/data/entity/patch/patch_address_register.dart';
import 'package:projeto_final/data/entity/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/entity/register_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/data/repositories/user_repository.dart';
import 'package:projeto_final/external/login_mapper.dart';
import 'package:projeto_final/external/patch_address_register_mapper.dart';
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
      debugPrint('Deu merda no registro ');
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
  Future<bool> patchUserRegister(PatchUserRegisterEntity patchUserRegister) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    var respostaPatchUserRegister = await http.patch(
      url,
      headers: {
        // 'Content-Type': 'application/json; charset=UTF-8',

        'Authorization': 'Bearer $token',
      },
      body: PatchUserRegisterMapper.toReplitMap(patchUserRegister),
    );
    if (respostaPatchUserRegister.statusCode == 200) {
      debugPrint('Patch Registro OK');
      return true;
    } else {
      debugPrint('Deu merda no Patch');
    }
    return false;
  }

  @override
  Future<bool> patchAddressRegister(PatchAddressRegisterEntity patchAddressRegister) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    var respostaPatchAddressRegister = await http.patch(
      url,
      headers: {
        // 'Content-Type': 'application/json; charset=UTF-8',

        'Authorization': 'Bearer $token',
      },
      body: PatchAddressRegisterMapper.toReplitMap(patchAddressRegister),
    );
    if (respostaPatchAddressRegister.statusCode == 200) {
      debugPrint('Patch Registro OK');
      return true;
    } else {
      debugPrint('Deu merda no Patch');
    }
    return false;
  }
}
