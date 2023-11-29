import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_project/data/models/episode_model.dart';
import 'package:rick_and_morty_project/data/repositories/get_episode_repository.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodeRepository repository;

  EpisodeBloc({required this.repository}) : super(EpisodeInitial()) {
    on<GetEpisodeEvent>((event, emit) async {
      emit(EpisodeLoading());

      try {
        final result = await repository.getEpisodeData(
          url: event.url,
        );
        emit(
          EpisodeSuccess(model: result),
        );
      } catch (e) {
        if (e is DioException) {
          emit(
            EpisodeError(
              errorText: e.response?.data.toString() ?? '',
            ),
          );
        } else {
          emit(
            EpisodeError(
              errorText: e.toString(),
            ),
          );
        }
      }
    });
  }
}
