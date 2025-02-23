import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rickandmorty/widget/appbar_widget.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(appBarName: "Lokasyonlar"),
      body: Text("Lokasyonlar"),
    );
  }
}
