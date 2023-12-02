part of 'episode_bloc.dart';

@immutable
sealed class EpisodeState {}

final class EpisodeInitial extends EpisodeState {}

final class EpisodeLoading extends EpisodeState {}

final class EpisodeSuccess extends EpisodeState {
  final EpisodeModel model;
  EpisodeSuccess({required this.model});
}

final class EpisodeError extends EpisodeState {
  final String errorText;
  EpisodeError({required this.errorText});
}

final class AllEpisodeLoading extends EpisodeState {}

final class AllEpisodeSuccess extends EpisodeState {
  final AllEpisodeModel allEpisode;
  AllEpisodeSuccess({required this.allEpisode});
}

final class AllEpisodeError extends EpisodeState {
  final String errorText;
  AllEpisodeError({required this.errorText});
}
