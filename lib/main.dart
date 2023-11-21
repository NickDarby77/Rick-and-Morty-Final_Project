import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/core/services/dio/dio_settings.dart';
import 'package:rick_and_morty_project/data/repositories/character_repository.dart';
import 'package:rick_and_morty_project/data/repositories/location_repository.dart';
import 'package:rick_and_morty_project/presentation/blocs/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty_project/presentation/blocs/location_bloc/locations_bloc.dart';
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
          RepositoryProvider(
            create: (context) => LocationRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio,
            ),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CharactersBloc(
                repository: RepositoryProvider.of<CharacterRepository>(context),
              ),
            ),
            BlocProvider(
              create: (context) => LocationsBloc(
                repository: RepositoryProvider.of<LocationRepository>(context),
              ),
            ),
          ],
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
