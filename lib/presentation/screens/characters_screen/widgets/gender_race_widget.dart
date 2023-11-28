import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class GenderRaceWidget extends StatelessWidget {
  const GenderRaceWidget({
    super.key,
    required this.data,
    required this.title,
    required this.subTitle,
  });

  final CharacterResults data;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.unselectedLabelStyle,
        ),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: AppFonts.s14w400,
        ),
      ],
    );
  }
}
