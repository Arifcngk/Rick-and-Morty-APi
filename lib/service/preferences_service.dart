import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences preferences;
  PreferencesService({required this.preferences});

  final String _characterKey = "charecters";
  saveCharecter(int id) async {
    final characterList = await preferences.getStringList(_characterKey) ?? [];
    characterList.add(id.toString());
    await preferences.setStringList(_characterKey, characterList);
  }

  void removeCharacter(int id) async {
    final characterList = preferences.getStringList(_characterKey) ?? [];
    characterList.remove(id.toString());
    await preferences.setStringList(_characterKey, characterList);
  }

  List<int> getCharacters() {
    final characterList = preferences.getStringList(_characterKey) ?? [];
    return characterList.map((e) => int.parse(e)).toList();
  }
}
