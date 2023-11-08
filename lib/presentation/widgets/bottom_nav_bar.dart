import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        currentIndex = value;
        setState(() {});
      },
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.navBarBgColor,
      selectedItemColor: AppColors.selectedItemColor,
      unselectedItemColor: AppColors.unselectedItemColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: AppFonts.selectedLabelStyle,
      unselectedLabelStyle: AppFonts.unselectedLabelStyle,
      items: [
        BottomNavigationBarItem(
          backgroundColor: AppColors.navBarBgColor,
          icon: Image.asset(
            'assets/images/character.png',
            color: currentIndex == 0
                ? AppColors.selectedItemColor
                : AppColors.unselectedItemColor,
          ),
          label: 'Персонажи',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/location.png',
            color: currentIndex == 1
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
