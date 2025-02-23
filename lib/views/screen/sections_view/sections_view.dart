import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rickandmorty/widget/appbar_widget.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(appBarName: "Sections"),
      body: Text("Sections"),
    );
  }
}
