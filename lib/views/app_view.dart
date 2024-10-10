import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  AppView({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarWidget(),
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateTextStyle.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: Theme.of(context).colorScheme.primary);
            } else {
              return TextStyle(color: Theme.of(context).colorScheme.tertiary);
            }
          },
        )),
        child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            destinations: [
              _menuItem(context,
                  index: 0,
                  currentIndex: navigationShell.currentIndex,
                  label: "Karakterler",
                  icon: Icons.face),
              _menuItem(context,
                  index: 1,
                  currentIndex: navigationShell.currentIndex,
                  label: "Favorilerim",
                  icon: Icons.bookmark),
              _menuItem(context,
                  index: 2,
                  currentIndex: navigationShell.currentIndex,
                  label: "Konumlar",
                  icon: Icons.location_on),
              _menuItem(context,
                  index: 3,
                  currentIndex: navigationShell.currentIndex,
                  label: "Bölümler",
                  icon: Icons.menu),
            ]),
      ),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String label,
    required IconData icon,
  }) {
    return NavigationDestination(
      icon: Icon(icon,
          color: currentIndex == index
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.tertiary),
      label: label,
    );
  }

  AppBar _AppBarWidget() {
    return AppBar(
      title: const Text(
        "Rick and Mort",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
