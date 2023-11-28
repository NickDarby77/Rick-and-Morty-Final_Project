import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/presentation/screens/characters_screen/widgets/gender_race_widget.dart';
import 'package:rick_and_morty_project/presentation/screens/characters_screen/widgets/location_data_widget.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class CharsDataWidget extends StatelessWidget {
  const CharsDataWidget({
    super.key,
    required this.data,
  });

  final CharacterResults data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 90),
            Text(
              data.name ?? '',
              style: AppFonts.s34w400,
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
              style: AppFonts.s13w400,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                GenderRaceWidget(
                  data: data,
                  title: 'Gender',
                  subTitle: data.gender ?? '',
                ),
                const SizedBox(width: 120),
                GenderRaceWidget(
                  data: data,
                  title: 'Race',
                  subTitle: data.species ?? '',
                ),
              ],
            ),
            const SizedBox(height: 20),
            LocationDataWidget(
              data: data,
              title: 'Place of Birth',
              subTitle: data.origin?.name ?? '',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            LocationDataWidget(
              data: data,
              title: 'Location',
              subTitle: data.location?.name ?? '',
              onPressed: () {},
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
