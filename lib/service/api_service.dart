import 'dart:math';

import 'package:dio/dio.dart';
import 'package:rickandmorty/model/characters_model.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(baseUrl: "https://rickandmortyapi.com/api"),
  );

  Future<CharactersModel> getCharacters() async {
    try {
      final response = await _dio.get("/character");
      print(response.data); // Gelen veriyi kontrol edelim
      return CharactersModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
