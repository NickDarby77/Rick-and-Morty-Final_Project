import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 66,
              foregroundImage: AssetImage(
                'assets/images/ricky.png',
              ),
            ),
            SizedBox(height: 33),
            Text(
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
