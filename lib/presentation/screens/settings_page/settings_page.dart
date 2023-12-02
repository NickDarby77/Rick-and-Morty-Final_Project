import 'package:flutter/material.dart';
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
                        'dsfdsfdsdsds',
                        style: AppFonts.s10w500Green,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'dsadsfdsfds',
                        style: AppFonts.s16w500White,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'fdsfsdgfdsg',
                        style: AppFonts.s12w400Gender,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: 335,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
            )
          ],
        ),
      ),
    );
  }
}
