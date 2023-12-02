import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/presentation/blocs/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';
import 'package:rick_and_morty_project/presentation/theme/theme_provider.dart';
import 'package:rick_and_morty_project/presentation/common_widgets/grid_view_widget.dart';
import 'package:rick_and_morty_project/presentation/common_widgets/list_view_widget.dart';
import 'package:rick_and_morty_project/presentation/common_widgets/text_field_widget.dart';
import 'package:rick_and_morty_project/presentation/common_widgets/total_characters_widget.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersListPage> {
  bool isList = true;
  TextEditingController controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    BlocProvider.of<CharactersBloc>(context).add(
      GetCharactersDataEvent(),
    );
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage <= 42) {
          currentPage++;
          BlocProvider.of<CharactersBloc>(context).add(
            GetCharactersDataEvent(page: currentPage.toString()),
          );
        }
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        if (currentPage > 0) {
          currentPage--;
          BlocProvider.of<CharactersBloc>(context).add(
            GetCharactersDataEvent(page: currentPage.toString()),
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

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFieldWidget(
          controller: controller,
          hintText: 'Найти персонажа',
          onSearch: () {
            BlocProvider.of<CharactersBloc>(context).add(
              GetCharactersDataEvent(
                name: controller.text,
              ),
            );
          },
          onChanged: (value) {
            BlocProvider.of<CharactersBloc>(context).add(
              GetCharactersDataEvent(
                name: value,
              ),
            );
          },
          onFilter: () {
            showDialog(
              context: context,
              builder: (contex) => AlertDialog(
                content: Column(
                  children: [
                    const Text(
                      'СТАТУС',
                      style: TextStyle(
                        color: Color(0xFF5B6975),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.50,
                      ),
                    ),
                    Checkbox(
                      value: isChecked,
                      onChanged: (val) {
                        setState(
                          () {
                            isChecked = val!;
                          },
                        );
                      },
                      checkColor: Colors.amber,
                    ),
                    Checkbox(
                      value: isChecked,
                      onChanged: (val) {
                        setState(
                          () {
                            isChecked = val!;
                          },
                        );
                      },
                      checkColor: Colors.amber,
                    ),
                  ],
                ),
              ),
            );
          },
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
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CharactersSuccess) {
            return Column(
              children: [
                CharactersNumberTextWidget(
                  count: state.model.info?.count.toString() ?? '',
                  isList: isList,
                  onPressed: () {
                    isList = !isList;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 12),
                isList
                    ? ListViewWidget(
                        dataResults: state.model.results ?? [],
                        scrollController: _scrollController,
                      )
                    : GridViewWidget(
                        dataResults: state.model.results ?? [],
                        scrollController: _scrollController,
                      ),
              ],
            );
          } else if (state is CharactersError) {
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
                    'assets/images/faku.png',
                    height: 250,
                    width: 150,
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Персонаж с таким именем\nне найден',
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
    );
  }
}
