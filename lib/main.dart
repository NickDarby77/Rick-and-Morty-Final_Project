import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/bloc/characters_bloc.dart';
import 'package:rick_and_morty_project/core/services/dio/dio_settings.dart';
import 'package:rick_and_morty_project/data/repositories/character_repository.dart';
import 'package:rick_and_morty_project/presentation/screens/splash_screens/splash.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldUnfocus(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => DioSettings(),
          ),
          RepositoryProvider(
            create: (context) => CharacterRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio,
            ),
          ),
        ],
        child: BlocProvider(
          create: (context) => CharactersBloc(
            repository: RepositoryProvider.of<CharacterRepository>(context),
          ),
          child: MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBgColor,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.scaffoldBgColor,
                elevation: 0,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const Splash(),
          ),
        ),
      ),
    );
  }
}

class TextFieldUnfocus extends StatelessWidget {
  const TextFieldUnfocus({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: child,
      );
}

/*
Questions to ask Abai
1. BottomNavBar Locations, Episodes, Settings
2. CharacterDetails get Api request
3. scroll pages all
*/

/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Добавляем обработчик событий при достижении конца списка
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // Вызовите вашу функцию, когда достигнут конец списка
        // Например, вы можете вызвать здесь вашу функцию
        // myFunction();
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Пример скролла с вызовом функции при достижении конца'),
        ),
        body: ListView.builder(
          controller: _scrollController, // Присваиваем контроллер скролла ListView
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Элемент $index'),
            );
          },
        ),
      ),
    );
  }
}*/