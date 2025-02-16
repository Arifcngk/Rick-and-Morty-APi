import 'package:get_it/get_it.dart';
import 'package:rickandmorty/service/api_service.dart';
import 'package:rickandmorty/service/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator()  async{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => PreferencesService(preferences: preferences));
  locator.registerLazySingleton(() => ApiService());
}
