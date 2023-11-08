import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/presentation/screens/characters/characters_list.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/screen2.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Future<void> goToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CharactersListPage(),
      ),
    );
  }
}
