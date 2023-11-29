import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/data/models/episode_model.dart';
import 'package:rick_and_morty_project/presentation/blocs/episode_bloc/bloc/episode_bloc.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';

class EpisodesWidget extends StatefulWidget {
  const EpisodesWidget({
    super.key,
    required this.data,
  });

  final CharacterResults data;

  @override
  State<EpisodesWidget> createState() => _EpisodesWidgetState();
}

class _EpisodesWidgetState extends State<EpisodesWidget> {
  List<EpisodeModel> episodeData = [];

  void getData() {
    for (int i = 0; i < widget.data.episode!.length; i++) {
      BlocProvider.of<EpisodeBloc>(context).add(
        GetEpisodeEvent(
          url: widget.data.episode?[i] ?? '',
        ),
      );
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: BlocListener<EpisodeBloc, EpisodeState>(
        listener: (context, state) {
          if (state is EpisodeSuccess) {
            episodeData.add(state.model);
          }
          setState(() {});
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          shrinkWrap: true,
          itemCount: episodeData.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 9,
            ),
            child: Row(
              children: [
                Container(
                  width: 74,
                  height: 74,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://via.placeholder.com/74x74",
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              episodeData[index].name ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
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
          ),
        ),
      ),
    );
  }
}
