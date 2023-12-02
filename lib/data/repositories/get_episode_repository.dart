import 'package:dio/dio.dart';
import 'package:rick_and_morty_project/data/models/all_episode_model.dart';
import 'package:rick_and_morty_project/data/models/episode_model.dart';

class GetEpisodeRepository {
  final Dio dio;
  GetEpisodeRepository({required this.dio});

  Future<EpisodeModel> getEpisodeData({required String url}) async {
    final Response response = await dio.get(url);
    return EpisodeModel.fromJson(response.data);
  }

  Future<AllEpisodeModel> getAllEpisodes(
      {String? episodeName, String? page}) async {
    final Response response = await dio.get(
      'https://rickandmortyapi.com/api/episode',
      queryParameters: {
        "id": episodeName,
        "page": page,
      },
    );
    return AllEpisodeModel.fromJson(response.data);
  }
}
