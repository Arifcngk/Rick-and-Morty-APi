import 'package:flutter/material.dart';
import 'package:rickandmorty/model/characters_model.dart';
import 'package:rickandmorty/model/episode_model.dart';
import 'package:rickandmorty/views/screen/charecter_detail_view/charecter_detail_view_model.dart';
import 'package:rickandmorty/widget/appbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/widget/decorated_container.dart';

class CharecterDetailView extends StatefulWidget {
  final CharacterModel charecterModel;
  const CharecterDetailView({super.key, required this.charecterModel});

  @override
  State<CharecterDetailView> createState() => _CharecterDetailViewState();
}

class _CharecterDetailViewState extends State<CharecterDetailView> {
  @override
  void initState() {
    super.initState();
    context
        .read<CharecterDetailViewModel>()
        .getEpisodes(widget.charecterModel.episodeModel);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppbarWidget(appBarName: "Karakter", transparent: true),
        body: Center(
          child: DecoratedContainer(
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
                          widget.charecterModel.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        _labelsView(context),
                        const SizedBox(height: 40),
                        _seasons(),
                        const SizedBox(height: 40),
                        _episodeListView(),
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

  Flexible _episodeListView() {
    return Flexible(
      child: Consumer<CharecterDetailViewModel>(
        builder: (context, viewModel, child) {
          return ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final EpisodeModel model = viewModel.episodes[index];
                return ListTile(
                  leading: const Icon(
                    Icons.face_retouching_natural,
                    size: 36,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  ),
                  title: Text(
                    model.episode,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    model.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    indent: 30,
                    endIndent: 30,
                    height: 0,
                  ),
              itemCount: viewModel.episodes.length);
        },
      ),
    );
  }

  Container _seasons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        'Bölümler (${widget.charecterModel.episodeModel.length})',
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }

  Padding _labelsView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Wrap(
        runSpacing: 14,
        spacing: 7,
        children: [
          _labelWidget(context, label: widget.charecterModel.status),
          _labelWidget(context, label: widget.charecterModel.originModel.name),
          _labelWidget(context, label: widget.charecterModel.gender),
          _labelWidget(context, label: widget.charecterModel.species),
        ],
      ),
    );
  }

  Container _labelWidget(BuildContext context, {required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Padding characterAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90, bottom: 52),
      child: Hero(
        tag: widget.charecterModel.image,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 73,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            radius: 70,
            backgroundImage: NetworkImage(widget.charecterModel.image),
          ),
        ),
      ),
    );
  }
}
