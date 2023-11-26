import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:rick_and_morty_project/data/models/locations_model.dart';
import 'package:rick_and_morty_project/presentation/blocs/location_bloc/locations_bloc.dart';
import 'package:rick_and_morty_project/presentation/screens/location/location_details.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';
import 'package:rick_and_morty_project/presentation/theme/theme_provider.dart';
import 'package:rick_and_morty_project/presentation/widgets/text_field_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _CharactersListState();
}

class _CharactersListState extends State<LocationPage> {
  TextEditingController controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    BlocProvider.of<LocationsBloc>(context).add(
      GetLocationsDataEvent(),
    );
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage <= 126) {
          currentPage++;
          BlocProvider.of<LocationsBloc>(context).add(
            GetLocationsDataEvent(
              page: currentPage.toString(),
            ),
          );
        }
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        if (currentPage > 0) {
          currentPage--;
          BlocProvider.of<LocationsBloc>(context).add(
            GetLocationsDataEvent(
              page: currentPage.toString(),
            ),
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

  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextFieldWidget(
          controller: controller,
          hintText: 'Найти локацию',
          onSearch: () {
            BlocProvider.of<LocationsBloc>(context).add(
              GetLocationsDataEvent(
                name: controller.text,
              ),
            );
          },
          onChanged: (value) {
            BlocProvider.of<LocationsBloc>(context).add(
              GetLocationsDataEvent(name: value),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: BlocBuilder<LocationsBloc, LocationsState>(
          builder: (context, state) {
            if (state is LocationsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'Всего локаций: ${state.model.info?.count}'.toUpperCase(),
                    style: AppFonts.charactersNumber,
                  ),
                  const SizedBox(height: 21),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: state.model.results?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 9,
                        ),
                        child: Card(
                          color: const Color(0xff152A3A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LocationDetailsPage(
                                    locData: LocationResults(),
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/locations.png',
                                ),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 19,
                                    bottom: 9,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.model.results?[index].name ?? '',
                                        style: AppFonts.locationNameStyle,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${state.model.results?[index].type} · ${state.model.results?[index].dimension}',
                                        style: AppFonts.s12w400Gender,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else if (state is LocationsLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is LocationsError) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 29),
                    Text(
                      'Результаты поиска'.toUpperCase(),
                      style: AppFonts.charactersNumber,
                    ),
                    const SizedBox(height: 160),
                    Image.asset(
                      'assets/images/noLocation.png',
                    ),
                    const SizedBox(height: 33),
                    const Text(
                      'Локации с таким\nназванием не найдено',
                      style: AppFonts.hintStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
