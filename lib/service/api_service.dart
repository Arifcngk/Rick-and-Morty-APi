// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/model/episode_model.dart';

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

  Future<List<EpisodeModel>> getMultipleEpisode(List<String> list) async {
    if (list.isEmpty) return []; // Boş liste kontrolü

    try {
      final List<String> episodeIds = list.map((e) {
        final lastPart = e.split("/").last;
        if (RegExp(r'^\d+$').hasMatch(lastPart)) {
          // Sadece rakamları al
          return lastPart;
        } else {
          throw FormatException("Geçersiz episode ID: $lastPart");
        }
      }).toList();

      final response = await _dio.get("/episode/${episodeIds.join(",")}");

      final data = response.data;
      if (data is List) {
        return data.map((e) => EpisodeModel.fromMap(e)).toList();
      } else if (data is Map<String, dynamic>) {
        return [EpisodeModel.fromMap(data)];
      } else {
        throw Exception("Beklenmeyen veri formatı: $data");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LocationModel> getAllLocations({String? url}) async {
    try {
      final response = await _dio.get(url ?? '/location');
      return LocationModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
