import 'package:flutter/material.dart';
import 'package:rickandmorty/views/screen/charecters_view/characters_view_model.dart';
import 'package:rickandmorty/widget/character_card_listview.dart';
import 'package:rickandmorty/widget/character_card_widget.dart';
import 'package:provider/provider.dart';

class CharectersView extends StatefulWidget {
  const CharectersView({super.key});

  @override
  State<CharectersView> createState() => _CharectersViewState();
}

class _CharectersViewState extends State<CharectersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersViewModel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          const SizedBox(height: 12),
          _searchInputWidget(),
          const SizedBox(height: 8),
          Consumer<CharactersViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.charactersModel == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return CharacterCardListView(
                  characters: viewModel.charactersModel!.characters,
                  onLoadMore: () => viewModel.getCharacterMore(),
                  loadMore: viewModel.loadMore,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _searchInputWidget() {
    return TextFormField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          hintText: "Karekterlerde ara",
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search_sharp),
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
    );
  }
}
