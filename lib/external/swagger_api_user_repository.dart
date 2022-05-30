import 'dart:convert';
import 'package:projeto_final/data/entity/credentials_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/data/entity/user_entity.dart';
import 'package:projeto_final/data/repositories/user_repository.dart';
import 'package:projeto_final/external/login_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SwaggerApiUserRepository implements UserRepository {
  @override
  Future<bool> login(LoginEntity login) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(login.cpf);
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/auth/login');
    var respostaLogin = await http.post(
      url,
      body: LoginMapper.toReplitMap(login),
    );
    if (respostaLogin.statusCode == 201) {
      await sharedPreferences.setString(
          'token', '${jsonDecode(respostaLogin.body)["token"]}');
      print('Token: ' + jsonDecode(respostaLogin.body)['token']);
      final token = jsonDecode(respostaLogin.body)['token'];

      //Usuario

      var urlUser = Uri.parse('https://cubos-las-api.herokuapp.com/user');
      var respostaUser = await http.get(
        urlUser,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      print(jsonDecode(respostaUser.body)['fullName']);
      return true;
    } else {
      print(jsonDecode(respostaLogin.body));
      return false;
    }
  }

  @override
  // Future<void> logout() {

  // }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }

  @override
  Future<void> register(CredentialsEntity credentials) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Future<UserEntity?> get user => throw UnimplementedError();
}
