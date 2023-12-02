import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Настройки',
          style: AppFonts.locationNameStyle,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 38,
                ),
                SizedBox(width: 18),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oleg Belotserkovsky',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rick',
                        style: TextStyle(
                          color: Color(0x996E798C),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {},
              child: Container(
                width: 335,
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF22A2BD)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Редактировать',
                      style: TextStyle(
                        color: Color(0xFF22A2BD),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.09,
                        letterSpacing: 0.15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
              thickness: 2,
              color: AppColors.navBarBgColor,
            ),
            const SizedBox(height: 30),
            const Text(
              'ВНЕШНИЙ ВИД',
              style: TextStyle(
                color: Color(0xFF5B6975),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.50,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/palette.svg',
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Темная тема',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.15,
                              ),
                            ),
                            Text(
                              'Включена',
                              style: TextStyle(
                                color: Color(0x996E798C),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.lightBgColor,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(
              thickness: 2,
              color: AppColors.navBarBgColor,
            ),
            const SizedBox(height: 30),
            const Text(
              'О ПРИЛОЖЕНИИ',
              style: TextStyle(
                color: Color(0xFF5B6975),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.50,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
              thickness: 2,
              color: AppColors.navBarBgColor,
            ),
            const SizedBox(height: 30),
            const Text(
              'ВЕРСИЯ ПРИЛОЖЕНИЯ',
              style: TextStyle(
                color: Color(0xFF5B6975),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.50,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Rick & Morty  v1.0.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
