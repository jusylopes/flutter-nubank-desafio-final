import 'dart:convert';
import 'package:projeto_final/data/entity/user_entity.dart';
import 'package:projeto_final/data/entity/details_user_entity.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/data/entity/token_entity.dart';
import 'package:projeto_final/data/repositories/user_repository.dart';
import 'package:projeto_final/external/login_mapper.dart';
import 'package:projeto_final/external/user_mapper.dart';
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
  Future<bool> register(UserEntity user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse('https://cubos-las-api.herokuapp.com/auth/user');
    var respostaUser = await http.post(
      url,
      body: UserMapper.toReplitMap(user),
    );
    if (respostaUser.statusCode == 201) {
      return true;
    } else {
      print('Deu merda no registro ');
    }
    return false;
  }

  @override
  // Future<List<DetailsUserEntity>> getDetailsUser() async {
  Future<void> getDetailsUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var urlUser = Uri.parse('https://cubos-las-api.herokuapp.com/user');
    var token = sharedPreferences.getString('token');
    var respostaUser = await http.get(
      urlUser,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(jsonDecode(respostaUser.body)['rg']);
    var responseUser = json.decode(respostaUser.body);
    print(responseUser['contacts']['email']);
  }
}
