part of 'episode_bloc.dart';

@immutable
sealed class EpisodeEvent {}

class GetEpisodeEvent extends EpisodeEvent {
  final String url;
  GetEpisodeEvent({required this.url});
}

class GetAllEpisodesEvent extends EpisodeEvent {
  final String? episode;
  final String? page;
  GetAllEpisodesEvent({this.episode, this.page});
}
