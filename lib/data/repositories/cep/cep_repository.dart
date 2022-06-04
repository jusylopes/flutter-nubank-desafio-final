import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_final/data/repositories/cep/cep_model.dart';

class CepRepository {
  Future<CepModel> fetchCep({required String cep}) async {
    final url = Uri.parse('https://brasilapi.com.br/api/cep/v1/$cep');
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CepModel.fromJson(json);
    } else {
      throw Exception('Erro - requisicao de cep');
    }
  }
}
