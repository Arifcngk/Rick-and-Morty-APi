// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EpisodeModel {
  final int id;
  final String name;
  final String episode;
  final List<String> characters;
  final String url;

  EpisodeModel({
    required this.id,
    required this.name,
    required this.episode,
    required this.characters,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'episode': episode,
      'characters': characters,
      'url': url,
    };
  }

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    final episodeString = map['episode'] as String;
    final episodeList = episodeString.replaceAll("S", "").split('E');

    // Episode list kontrolü (En az 2 eleman olmalı)
    if (episodeList.length < 2 ||
        episodeList.first.isEmpty ||
        episodeList.last.isEmpty) {
      throw FormatException("Geçersiz episode formatı: $episodeString");
    }

    // Sayısal olup olmadığını kontrol et
    final seasonNumber = int.tryParse(episodeList.first);
    final episodeNumber = int.tryParse(episodeList.last);
    if (seasonNumber == null || episodeNumber == null) {
      throw FormatException(
          "Episode numarası sayıya çevrilemedi: $episodeString");
    }

    return EpisodeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      episode: "$episodeNumber. Bölüm / $seasonNumber. Sezon",
      characters: List<String>.from(map['characters'].map((e) => e.toString())),
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeModel.fromJson(String source) =>
      EpisodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
