import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/presentation/screens/characters_screen/chars/characters_list.dart';
import 'package:rick_and_morty_project/presentation/screens/episodes/episodes_screen.dart';
import 'package:rick_and_morty_project/presentation/screens/location/location_page.dart';
import 'package:rick_and_morty_project/presentation/common_widgets/bottom_nav_bar.dart';
import 'package:rick_and_morty_project/presentation/screens/settings_page/settings_page.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const CharactersListPage(),
    const LocationPage(),
    const EpisodeScreen(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavBarWidget(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentInxdex: currentIndex,
      ),
    );
  }
}
