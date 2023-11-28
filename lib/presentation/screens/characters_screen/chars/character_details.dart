import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/presentation/screens/characters_screen/widgets/chars_data_widget.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({super.key, required this.data});

  final CharacterResults data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 220,
                  child: Image.network(
                    data.image ?? '',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                CharsDataWidget(data: data),
              ],
            ),
            Container(
              height: 220,
              color: const Color(0xff0B1E2D).withOpacity(0.65),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.height * 0.15,
              child: CircleAvatar(
                radius: 83,
                backgroundColor: const Color(0xff0B1E2D),
                child: CircleAvatar(
                  radius: 73,
                  foregroundImage: NetworkImage(data.image ?? ''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
