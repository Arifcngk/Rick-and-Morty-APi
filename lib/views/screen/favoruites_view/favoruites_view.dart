import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screen/favoruites_view/favorite_view_model.dart';
import 'package:rickandmorty/widget/character_card_listview.dart';

class FavoruitesView extends StatefulWidget {
  const FavoruitesView({super.key});

  @override
  State<FavoruitesView> createState() => _FavoruitesViewState();
}

class _FavoruitesViewState extends State<FavoruitesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteViewModel>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoriteViewModel>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: viewModel.charactersModel.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CharacterCardListView(
                    characters: viewModel.charactersModel,
                  )
                ],
              ),
      ),
    );
  }
}
