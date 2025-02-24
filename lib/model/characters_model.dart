import 'package:rickandmorty/model/info_model.dart';

class CharactersModel {
  InfoModel info;
  final List<CharacterModel> characters;

  CharactersModel({required this.info, required this.characters});
  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    final info = InfoModel.fromMap(json["info"]);

    final characters = (json['results'] as List)
        .map((e) => CharacterModel.fromJson(e))
        .toList();
    return CharactersModel(info: info, characters: characters);
  }
}

// karakter bilgileri classı
class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final LocationModel locationModel;
  final OriginModel originModel;

  final List<String> episodeModel;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.gender,
      required this.image,
      required this.locationModel,
      required this.originModel,
      required this.episodeModel});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
      locationModel: LocationModel.fromMap(json['location']),
      originModel: OriginModel.fromJson(json['origin']),
      episodeModel: List<String>.from(json['episode']),
    );
  }
}

// karakter dünyları info class
class LocationModel {
  final String name;
  final String url;

  LocationModel({required this.name, required this.url});
  factory LocationModel.fromMap(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      url: json['url'],
    );
  }
}

class OriginModel {
  final String name;
  final String url;

  OriginModel({required this.name, required this.url});

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
