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
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Gender',
                                  style: TextStyle(
                                    color: Color(0xFF5B6975),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.gender ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.25,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 120),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Race',
                                  style: TextStyle(
                                    color: Color(0xFF5B6975),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.species ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Place of Birth',
                                  style: TextStyle(
                                    color: Color(0xFF5B6975),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.origin?.name ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Location',
                                  style: TextStyle(
                                    color: Color(0xFF5B6975),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.location?.name ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
