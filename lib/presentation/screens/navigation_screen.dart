import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/presentation/screens/characters/characters_list.dart';
import 'package:rick_and_morty_project/presentation/widgets/bottom_nav_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    CharactersListPage(),
    CharactersListPage(),
    CharactersListPage(),
    CharactersListPage(),
    /*locations, episodes, settings */
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavBarWidget(
        onTap: (val) {
          currentIndex = val;
          setState(() {});
        },
        currentInxdex: currentIndex,
      ),
    );
  }
}
