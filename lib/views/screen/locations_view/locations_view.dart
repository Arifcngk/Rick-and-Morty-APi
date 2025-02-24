import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screen/locations_view/locations_view_model.dart';
import 'package:rickandmorty/widget/appbar_widget.dart';
import 'package:rickandmorty/widget/decorated_container.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  void initState() {
    context.read<LocationsViewModel>().getLocations();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppbarWidget(appBarName: "Lokasyonlar"),
        body: DecoratedContainer(child: Text("TEst")),
      ),
    );
  }

  Flexible _locationListView() {
    return Flexible(
      child: Consumer<LocationsViewModel>(
        builder: (context, viewModel, child) {
          return ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                ;
                return const ListTile(
                  leading: Icon(
                    Icons.face_retouching_natural,
                    size: 36,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    indent: 30,
                    endIndent: 30,
                    height: 0,
                  ),
              itemCount: 5);
        },
      ),
    );
  }
}
