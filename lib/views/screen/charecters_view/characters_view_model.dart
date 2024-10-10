import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/service/api_service.dart';

class CharactersViewModel extends ChangeNotifier {
  final _apiService = locator<ApiService>();
  CharactersModel? _charactersModel;
  CharactersModel? get charactersModel => _charactersModel;

  void getCharacters() async {
    _charactersModel = await _apiService.getCharacters();
    notifyListeners();
    print("Karakterler Geldi");
  }
}
