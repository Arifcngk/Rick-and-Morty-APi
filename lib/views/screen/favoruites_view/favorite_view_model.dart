import 'package:flutter/foundation.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/service/api_service.dart';
import 'package:rickandmorty/service/preferences_service.dart';

class FavoriteViewModel extends ChangeNotifier {
  final _prefencesService = locator<PreferencesService>();
  List<int> _favorites = [];
  final _apiService = locator<ApiService>();

  List<CharacterModel> _charactersModel = [];
  List<CharacterModel> get charactersModel => _charactersModel;

  void getFavorites() {
    _favorites = _prefencesService.getCharacters();
    _getCharacter();
  }

  void _getCharacter() async {
    _charactersModel = await _apiService.getMultipleCharacters(_favorites);
    notifyListeners();
  }
}
