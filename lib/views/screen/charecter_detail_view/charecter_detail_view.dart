import 'package:flutter/material.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/widget/appbar_widget.dart';

class CharecterDetailView extends StatelessWidget {
  final CharacterModel charecterModel;
  const CharecterDetailView({super.key, required this.charecterModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:
            const AppbarWidget(appBarName: "Karakterler", transparent: true),
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/bg-image.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                characterAvatar(context),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          charecterModel.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Örnek Metin",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding characterAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90, bottom: 52),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 73,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          radius: 70,
          backgroundImage: NetworkImage(charecterModel.image),
        ),
      ),
    );
  }
}
