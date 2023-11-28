import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class LocationDataWidget extends StatelessWidget {
  const LocationDataWidget({
    super.key,
    required this.data,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final CharacterResults data;
  final String title;
  final String subTitle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
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
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.lightBgColor,
            size: 14,
          ),
        ),
      ],
    );
  }
}
