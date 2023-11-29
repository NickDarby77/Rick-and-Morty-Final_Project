import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/presentation/blocs/episode_bloc/bloc/episode_bloc.dart';
import 'package:rick_and_morty_project/presentation/screens/characters_screen/widgets/chars_data_widget.dart';
import 'package:rick_and_morty_project/presentation/screens/characters_screen/widgets/episodes_widget.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({super.key, required this.charsData});

  final CharacterResults charsData;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EpisodeBloc>(context).add(
      GetEpisodeEvent(
        url: charsData.episode?[0] ?? '',
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 220,
                    child: ClipRRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 2,
                          sigmaY: 2,
                        ),
                        child: Image.network(
                          charsData.image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 111,
                    child: CircleAvatar(
                      radius: 83,
                      backgroundColor: const Color(0xff0B1E2D),
                      child: CircleAvatar(
                        radius: 73,
                        foregroundImage: NetworkImage(
                          charsData.image ?? '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CharsDataWidget(data: charsData),
              const SizedBox(height: 20),
              const Divider(
                thickness: 2,
                color: AppColors.navBarBgColor,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      'Эпизоды',
                      style: AppFonts.locationNameStyle,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Text(
                        'Все эпизоды',
                        style: AppFonts.unselectedLabelStyle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              EpisodesWidget(data: charsData),
            ],
          ),
        ),
      ),
    );
  }
}
