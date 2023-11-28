import 'package:flutter/material.dart';
import 'package:rick_and_morty_project/data/models/locations_model.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class LocationDetailsPage extends StatelessWidget {
  const LocationDetailsPage({super.key, required this.locData});

  final LocationResults locData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBgColor,
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/locations.png',
                  width: double.maxFinite,
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
              ],
            ),
            Card(
              color: AppColors.scaffoldBgColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 26,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locData.name ?? 'null',
                      style: AppFonts.s24w700,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      locData.dimension ?? 'null',
                      style: AppFonts.s12w400Gender,
                    ),
                    const SizedBox(height: 26),
                    const Text(
                      'Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.',
                      style: AppFonts.s13w400,
                    ),
                    const SizedBox(height: 26),
                    const Text(
                      'Персонажи',
                      style: AppFonts.locationNameStyle,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 395,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 60,
                        itemBuilder: (context, index) => const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'locData.residents??[]',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
