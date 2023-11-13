import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    super.key,
    required this.data
  });

  final CharacterResults data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 66,
              foregroundImage:NetworkImage(data.image?? ''),
            ),
            const SizedBox(height: 33),
            const Text(
              'Your Character Name',
              style: TextStyle(
                fontSize: 44,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
