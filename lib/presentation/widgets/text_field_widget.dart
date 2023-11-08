import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_project/bloc/characters_bloc.dart';
import 'package:rick_and_morty_project/presentation/theme/app_colors.dart';
import 'package:rick_and_morty_project/presentation/theme/app_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        BlocProvider.of<CharactersBloc>(context).add(
          GetCharactersDataEvent(name: value),
        );
      },
      style: AppFonts.s16w500White,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.navBarBgColor,
        prefixIcon: IconButton(
          padding: const EdgeInsets.only(
            left: 25,
            right: 15,
          ),
          onPressed: () {
            BlocProvider.of<CharactersBloc>(context).add(
              GetCharactersDataEvent(
                name: controller.text,
              ),
            );
          },
          icon: const Icon(
            Icons.search,
            color: AppColors.unselectedItemColor,
          ),
        ),
        hintText: 'Найти персонажа',
        hintStyle: AppFonts.hintStyle,
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 15),
          onPressed: () {},
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: AppColors.unselectedItemColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
