import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/service/preferences_service.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:go_router/go_router.dart';

class CharacterCardWidget extends StatefulWidget {
  final CharacterModel characterModel;
  bool isFavorite;
  CharacterCardWidget({
    super.key,
    required this.characterModel,
    this.isFavorite = false,
  });

  @override
  State<CharacterCardWidget> createState() => _CharacterCardWidgetState();
}

class _CharacterCardWidgetState extends State<CharacterCardWidget> {
  void favoriteCharacter() {
    if (widget.isFavorite) {
      locator<PreferencesService>().removeCharacter(widget.characterModel.id);
      widget.isFavorite = false;
      setState(() {});
      return;
    } else {
      locator<PreferencesService>().saveCharecter(widget.characterModel.id);
      widget.isFavorite = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        AppRoutes.characterProfile,
        extra: widget.characterModel,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      widget.characterModel.image,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 17),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.characterModel.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),
                      _infoTextMethod(
                          type: "Köken",
                          value: widget.characterModel.originModel.name),
                      const SizedBox(height: 5),
                      _infoTextMethod(
                          type: "Durum",
                          value:
                              "${widget.characterModel.status}-${widget.characterModel.species}"),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: favoriteCharacter,
                icon: Icon(
                  widget.isFavorite
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined,
                ))
          ],
        ),
      ),
    );
  }

  Column _infoTextMethod({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
