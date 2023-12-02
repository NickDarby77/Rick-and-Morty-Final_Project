import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/presentation/blocs/episode_bloc/bloc/episode_bloc.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';
import 'package:rick_and_morty_project/presentation/theme/theme_provider.dart';
import 'package:rick_and_morty_project/presentation/common_widgets/text_field_widget.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({super.key, this.data});

  final List<CharacterResults>? data;

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  TextEditingController controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    BlocProvider.of<EpisodeBloc>(context).add(
      GetAllEpisodesEvent(),
    );
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage <= 3) {
          currentPage++;
          BlocProvider.of<EpisodeBloc>(context).add(
            GetAllEpisodesEvent(page: currentPage.toString()),
          );
        }
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        if (currentPage > 0) {
          currentPage--;
          BlocProvider.of<EpisodeBloc>(context).add(
            GetAllEpisodesEvent(page: currentPage.toString()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFieldWidget(
          controller: controller,
          hintText: 'Найти эпизоды',
          onSearch: () {
            BlocProvider.of<EpisodeBloc>(context).add(
              GetAllEpisodesEvent(
                episode: controller.text,
              ),
            );
          },
          onChanged: (value) {
            BlocProvider.of<EpisodeBloc>(context).add(
              GetAllEpisodesEvent(
                episode: value,
              ),
            );
          },
          onFilter: () {},
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().changeTheme();
            },
            icon: const Icon(Icons.sunny),
          ),
        ],
      ),
      body: BlocBuilder<EpisodeBloc, EpisodeState>(
        builder: (context, state) {
          if (state is AllEpisodeLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is AllEpisodeError) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 29),
                  Text(
                    'Результаты поиска'.toUpperCase(),
                    style: AppFonts.charactersNumber,
                  ),
                  const SizedBox(height: 70),
                  Image.asset(
                    'assets/images/noEpisode.png',
                    height: 250,
                    width: 150,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Эпизода с таким названием нет',
                    style: AppFonts.hintStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else if (state is AllEpisodeSuccess) {
            return Column(
              children: [
                Text(
                  state.allEpisode.results?.first.episode ?? '',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    shrinkWrap: true,
                    itemCount: state.allEpisode.results?.length,
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
                                  'https://cdn.vox-cdn.com/thumbor/9HfS_-ugBoHDaLskP6ssJ8_nIkY=/0x22:1584x851/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/24415978/rick_and_morty_s4_image.png',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EPISODE ${state.allEpisode.results?[index].id}',
                                        style: AppFonts.episodeId,
                                      ),
                                      Text(
                                        state.allEpisode.results?[index].name ??
                                            '',
                                        style: AppFonts.s16w500White,
                                      ),
                                      Text(
                                        state.allEpisode.results?[index]
                                                .airDate ??
                                            "",
                                        style: AppFonts.airDate,
                                      ),
                                    ],
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
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
