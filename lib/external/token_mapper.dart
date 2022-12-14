import 'package:projeto_final/data/entity/user/post/token_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> token() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
}

class TokenMapper {
  static Map<String, dynamic> toReplitMap(TokenEntity tokenKey) {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${tokenKey.token}'
    };
  }
}
