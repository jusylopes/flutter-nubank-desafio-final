import 'dart:convert';
import 'package:http/http.dart';
import 'package:projeto_final/data/entity/get_user_entity.dart';
import 'package:projeto_final/data/entity/register_entity.dart';
import 'package:projeto_final/data/entity/details_user_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/data/entity/token_entity.dart';
import 'package:projeto_final/data/repositories/user_repository.dart';
import 'package:projeto_final/external/login_mapper.dart';
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
      final token = jsonDecode(respostaLogin.body)['token'];
      print(token);

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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    var respostaRegister = await http.post(
      url,
      body: RegisterMapper.toReplitMap(register),
    );
    // var json = jsonDecode(respostaRegister.body);
    // var registerEntity = RegisterEntity.fromJson(json);
    // print(registerEntity.fullName);
    // print(jsonDecode(respostaRegister.body));
    // print(register.cpf);
    if (respostaRegister.statusCode == 201) {
      print('Registro OK');
      return true;
    } else {
      print('Deu merda no registro ');
    }
    return false;
  }

  // @override
  // // Future<List<DetailsUserEntity>> getDetailsUser() async {
  // Future<void> getDetailsUser() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var urlUser = Uri.parse('https://cubos-las-api.herokuapp.com/user');
  //   var token = sharedPreferences.getString('token');
  //   var respostaUser = await http.get(
  //     urlUser,
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   print(jsonDecode(respostaUser.body)['rg']);
  //   var responseUser = json.decode(respostaUser.body);
  //   print(responseUser['contacts']['email']);
  // }

  @override
  // Future<List<DetailsUserEntity>> getDetailsUser() async {
  Future<Todo> getDetailsUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var urlUser = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    var token = sharedPreferences.getString('token');
    var respostaGetUser = await http.get(
      urlUser,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    // print(jsonDecode(respostaGetUser.body)['fullName']);
    // final rg = jsonDecode(respostaGetUser.body)['rg'];
    // print(rg);
    final json = jsonDecode(respostaGetUser.body);
    final todo = Todo(
      id: json['id'],
      fullName: json['fullName'],
      rg: json['rg'],
      cpf: json['cpf'],
      profilePictureUrl: json['profilePictureUrl'],
      birthDate: json['birthDate'],
      createdAt: json['createdAt'],
      // address: json['address'],
      // contacts: json['contacts'],
      email: json['contacts']['email'],
    );
    // var responseUser = json.decode(respostaGetUser.body);
    // final list = respostaGetUser.body as List;

    // List<GetUserEntity> getUserList = [];
    // for (var json in list) {
    //   final getUserEntity = GetUserEntity.fromJson(json);
    //   getUserList.add(getUserEntity);
    //   print(getUserList);
    // }
    // return getUserList;
    return todo;
  }
}

class Todo {
  final int id;
  final String fullName;
  final String rg;
  final String cpf;
  final String profilePictureUrl;
  final String birthDate;
  final String createdAt;
  final String email;
  // final String address;
  // final String contacts;

  Todo({
    required this.id,
    required this.fullName,
    required this.rg,
    required this.cpf,
    required this.profilePictureUrl,
    required this.birthDate,
    required this.createdAt,
    // required this.address,
    // required this.contacts,
    required this.email,
  });
}
