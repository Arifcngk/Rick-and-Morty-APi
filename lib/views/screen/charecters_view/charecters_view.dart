import 'package:flutter/material.dart';
import 'package:rickandmorty/views/screen/charecters_view/characters_view_model.dart';
import 'package:rickandmorty/widget/appbar_widget.dart';
import 'package:rickandmorty/widget/character_card_listview.dart';
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
    final viewModel = context.watch<CharactersViewModel>();
    return Scaffold(
      appBar: const AppbarWidget(
        appBarName: "Rick and Morty",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(height: 12),
            _searchInputWidget(context, viewModel: viewModel),
            const SizedBox(height: 8),
            Expanded(
              // Listeyi düzgün şekilde göstermesi için Expanded kullanıyoruz
              child: viewModel.charactersModel == null
                  ? const Center(child: CircularProgressIndicator())
                  : CharacterCardListView(
                      characters: viewModel.charactersModel!.characters,
                      onLoadMore: () => viewModel.getCharacterMore(),
                      loadMore: viewModel.loadMore,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchInputWidget(BuildContext context,
      {required CharactersViewModel viewModel}) {
    return TextFormField(
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (value) => viewModel.getCharacterSearch(value),
      decoration: InputDecoration(
        hintText: "Karekterlerde ara",
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.search_sharp),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
