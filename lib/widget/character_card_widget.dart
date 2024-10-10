import 'package:flutter/material.dart';
import 'package:rickandmorty/model/characters_model.dart';

class CharacterCardWidget extends StatelessWidget {
  final CharacterModel characterModel;
  CharacterCardWidget({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    characterModel.image,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 17),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      characterModel.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 7),
                    _infoTextMethod(
                        type: "Köken", value: characterModel.originModel.name),
                    const SizedBox(height: 5),
                    _infoTextMethod(
                        type: "Durum",
                        value:
                            "${characterModel.status}-${characterModel.species}"),
                  ],
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border_outlined))
        ],
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
