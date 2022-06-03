import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_final/data/entity/get/cep_model.dart';

class CepRepository {
  const CepRepository(this.httpClient);
  final http.Client httpClient;

  Future<CepModel> fetchCep(String cep) async {
    try {
      final url = Uri.parse('https://brasilapi.com.br/api/cep/v1/$cep');
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      debugPrint(json.statusCode.toString());

      final cepResult = CepModel(
        cep: json['cep'],
        state: json['state'],
        city: json['city'],
        neighborhood: json['neighborhood'],
        street: json['street'],
        service: json['service'],
      );

      return cepResult;
    } catch (e) {
      rethrow;
    }
  }
}
