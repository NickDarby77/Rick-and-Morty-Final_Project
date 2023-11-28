import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
    required this.currentInxdex,
    required this.onTap,
  });
  final int currentInxdex;
  final Function(int) onTap;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onTap,
      currentIndex: widget.currentInxdex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.selectedItemColor,
      unselectedItemColor: AppColors.unselectedItemColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: AppFonts.selectedLabelStyle,
      unselectedLabelStyle: AppFonts.unselectedLabelStyle,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/character.svg',
            colorFilter: widget.currentInxdex == 0
                ? const ColorFilter.mode(
                    AppColors.selectedItemColor,
                    BlendMode.srcIn,
                  )
                : const ColorFilter.mode(
                    AppColors.unselectedItemColor,
                    BlendMode.srcIn,
                  ),
          ),
          label: 'Персонажи',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/location.png',
            color: widget.currentInxdex == 1
                ? AppColors.selectedItemColor
                : AppColors.unselectedItemColor,
          ),
          label: 'Локациии',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: 'Эпизоды',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Настройки',
        ),
      ],
    );
  }
}
