import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:rickandmorty/views/screen/charecter_detail_view/charecter_detail_view.dart';
import 'package:rickandmorty/views/screen/charecter_detail_view/charecter_detail_view_model.dart';
import 'package:rickandmorty/views/screen/charecters_view/characters_view_model.dart';
import 'package:rickandmorty/views/screen/charecters_view/charecters_view.dart';
import 'package:rickandmorty/views/screen/favoruites_view/favorite_view_model.dart';
import 'package:rickandmorty/views/screen/favoruites_view/favoruites_view.dart';
import 'package:rickandmorty/views/screen/locations_view/locations_view.dart';
import 'package:rickandmorty/views/screen/locations_view/locations_view_model.dart';
import 'package:rickandmorty/views/screen/sections_view/sections_view.dart';

// Unique navigator keys for each branch
final _charactersKey = GlobalKey<NavigatorState>();
final _favoritesKey = GlobalKey<NavigatorState>();
final _locationsKey = GlobalKey<NavigatorState>();
final _sectionsKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();
  static const String characters = "/";

  static const String favorites = "/favorites";
  static const String locations = "/locations";
  static const String sections = "/sections";
  static const String profileRouter = "/characterProfile";

  static const String characterProfile = "/characterProfile";
}

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _charactersKey, // Unique key for this branch
          routes: [
            GoRoute(
                path: AppRoutes.characters,
                builder: (context, state) => ChangeNotifierProvider(
                      create: (context) => CharactersViewModel(),
                      child: const CharectersView(),
                    ), // Fix typo here
                routes: [
                  GoRoute(
                      path: AppRoutes.characterProfile,
                      builder: (context, state) => ChangeNotifierProvider(
                            create: (context) => CharecterDetailViewModel(),
                            child: CharecterDetailView(
                                charecterModel: state.extra as CharacterModel),
                          )),
                ]),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _favoritesKey, // Unique key for this branch
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => FavoriteViewModel(),
                child: const FavoruitesView(),
              ), // Fix typo here
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _locationsKey, // Unique key for this branch
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => LocationsViewModel(),
                child: const LocationsView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionsKey, // Unique key for this branch
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => const SectionsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
