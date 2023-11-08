import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/bloc/characters_bloc.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';
import 'package:rick_and_morty_project/presentation/widgets/bottom_nav_bar.dart';
import 'package:rick_and_morty_project/presentation/widgets/grid_view_widget.dart';
import 'package:rick_and_morty_project/presentation/widgets/list_view_widget.dart';
import 'package:rick_and_morty_project/presentation/widgets/text_field_widget.dart';
import 'package:rick_and_morty_project/presentation/widgets/total_characters_widget.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersListPage> {
  bool isList = true;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CharactersBloc>(context).add(
      GetCharactersDataEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFieldWidget(controller: controller),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersSuccess) {
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
                      )
                    : GridViewWidget(
                        dataResults: state.model.results ?? [],
                      ),
                const SizedBox(
                  height: 60,
                  child: BottomNavBarWidget(),
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
