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

  bool loadMore = false;

  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  void getCharacterMore() async {
    if (loadMore ||
        _charactersModel == null ||
        _charactersModel!.info.next == null) {
      print(
          "Yeni veri yüklenemedi. Sebep: loadMore=$loadMore, _charactersModel=${_charactersModel != null}, next=${_charactersModel?.info.next}");
      return;
    }

    print("Yeni karakterler yükleniyor...");
    setLoadMore(true);

    try {
      final data =
          await _apiService.getCharacters(url: _charactersModel!.info.next);
      if (data != null) {
        _charactersModel!.info = data.info;
        _charactersModel!.characters.addAll(data.characters);
        notifyListeners();
      }
    } catch (e) {
      print("Hata oluştu: $e");
    } finally {
      setLoadMore(false);
    }
  }
}
