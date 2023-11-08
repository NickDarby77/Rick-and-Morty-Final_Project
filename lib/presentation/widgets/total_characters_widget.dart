import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class CharactersNumberTextWidget extends StatelessWidget {
  const CharactersNumberTextWidget({
    super.key,
    required this.isList,
    required this.onPressed,
    required this.count,
  });

  final bool isList;
  final Function() onPressed;
  final String count;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Всего персонажей: $count'.toUpperCase(),
            style: AppFonts.charactersNumber,
          ),
          isList
              ? IconButton(
                  onPressed: onPressed,
                  icon: Image.asset(
                    'assets/images/group.png',
                    height: 24,
                    color: AppColors.unselectedItemColor,
                  ),
                )
              : IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.format_list_bulleted_sharp,
                    size: 24,
                    color: AppColors.unselectedItemColor,
                  ),
                ),
        ],
      ),
    );
  }
}
