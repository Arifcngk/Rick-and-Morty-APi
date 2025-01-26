// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/widget/character_card_widget.dart';

class CharacterCardListView extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback onLoadMore;
  final bool loadMore;
  const CharacterCardListView({
    super.key,
    required this.characters,
    required this.onLoadMore,
    this.loadMore = false,
  });

  @override
  State<CharacterCardListView> createState() => _CharacterCardListViewState();
}

class _CharacterCardListViewState extends State<CharacterCardListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _detectScrollBottom();
    super.initState();
  }

  void _detectScrollBottom() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;

      final delta = 200;

      if (maxScroll - currentPosition <= delta) {
        widget.onLoadMore();
        print("alta inildi");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.characters.length,
        itemBuilder: (context, index) {
          final characterModel = widget.characters[index];
          return Column(
            children: [
              CharacterCardWidget(
                characterModel: characterModel,
              ),
              if (widget.loadMore && index == widget.characters.length - 1)
                const Center(child: CircularProgressIndicator.adaptive()),
            ],
          );
        },
      ),
    );
  }
}
