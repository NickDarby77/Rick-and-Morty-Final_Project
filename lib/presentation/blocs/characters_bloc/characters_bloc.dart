import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_project/data/models/characters_model.dart';
import 'package:rick_and_morty_project/data/repositories/character_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository repository;

  CharactersBloc({required this.repository}) : super(CharactersInitial()) {
    on<GetCharactersDataEvent>((event, emit) async {
      emit(CharactersLoading());

      try {
        final result = await repository.getCharactersData(
          status: event.status,
          name: event.name,
          species: event.species,
          gender: event.gender,
          page: event.page,
        );
        emit(
          CharactersSuccess(model: result),
        );
      } catch (e) {
        if (e is DioException) {
          emit(
            CharactersError(
              errorText: e.response?.data.toString() ?? '',
            ),
          );
        } else {
          emit(
            CharactersError(
              errorText: e.toString(),
            ),
          );
        }
      }
    });
  }
}
