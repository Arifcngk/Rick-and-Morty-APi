import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screen/locations_view/location_listview.dart';
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
    super.initState();
    context.read<LocationViewmodel>().getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppbarWidget(
          appBarName: 'Konumlar',
          transparent: true,
        ),
        body: DecoratedContainer(
          topChild: const SizedBox(height: 120),
          child: _locationListView(),
        ),
      ),
    );
  }

  Widget _locationListView() {
    return Consumer<LocationViewmodel>(
      builder: (context, viewModel, child) {
        if (viewModel.locationModel == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: LocationListView(
              locationModel: viewModel.locationModel!,
              onLoadMore: viewModel.getMoreLocation,
              loadMore: viewModel.loadMore,
            ),
          );
        }
      },
    );
  }
}
