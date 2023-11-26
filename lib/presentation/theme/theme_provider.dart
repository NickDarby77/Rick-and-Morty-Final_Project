import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldBgColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBarBgColor,
    ),
  );

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    theme = ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.scaffoldBgColor : AppColors.lightBgColor,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDarkTheme ? AppColors.scaffoldBgColor : AppColors.lightBgColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDarkTheme
            ? AppColors.navBarBgColor
            : AppColors.lightTextFieldColor,
      ),
    );
    notifyListeners();
  }
}
