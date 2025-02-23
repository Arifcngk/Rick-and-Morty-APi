// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:rickandmorty/model/characters_model.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(baseUrl: "https://rickandmortyapi.com/api"),
  );

  Future<CharactersModel> getCharacters(
      {String? url, Map<String, dynamic>? args}) async {
    try {
      final response =
          await _dio.get(url ?? "/character", queryParameters: args);
      print(response.data); // Gelen veriyi kontrol edelim
      return CharactersModel.fromJson(response.data);
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<List<CharacterModel>> getMultipleCharacters(List<int> ids) async {
    try {
      final response = await _dio.get("/character/${ids.join(",")}");
      print(response.data); // Gelen veriyi kontrol edelim
      return (response.data as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
