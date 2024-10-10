import 'package:flutter/material.dart';
import 'package:rickandmorty/views/screen/charecters_view/characters_view_model.dart';
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
    // TODO: implement initState
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
                return Flexible(
                  child: ListView.builder(
                    itemCount: viewModel.charactersModel!.characters.length,
                    itemBuilder: (context, index) {
                      final characterModel =
                          viewModel.charactersModel!.characters[index];
                      return CharacterCardWidget(
                        characterModel: characterModel,
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _searchInputWidget() {
    return TextField(
      decoration: InputDecoration(
          hintText: "Karekterlerde ara",
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search_sharp),
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
    );
  }
}
