import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';

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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 90),
                        Text(
                          data.name ?? '',
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data.status?.toUpperCase() ?? '',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            color: getColor(
                              data.status ?? '',
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 220,
              color: const Color(0xff0B1E2D).withOpacity(0.7),
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

  Color getColor(String status) {
    if (status == "Alive") {
      return Colors.green;
    } else if (status == 'unknown') {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}
