import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/model/episode_model.dart';
import 'package:rickandmorty/service/api_service.dart';

class CharecterDetailViewModel extends ChangeNotifier {
  final _apiServis=locator<ApiService>();
  List<EpisodeModel> _episodes = [];
  List<EpisodeModel> get episodes => _episodes;


  void getEpisodes(List<String> urlList) async {
    _episodes = await _apiServis.getMultipleEpisode(urlList);
    notifyListeners();
  } 
}
