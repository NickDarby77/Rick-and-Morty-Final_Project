import 'package:dio/dio.dart';
import 'package:rick_and_morty_project/data/models/episode_model.dart';

class GetEpisodeRepository {
  final Dio dio;
  GetEpisodeRepository({required this.dio});

  Future<EpisodeModel> getEpisodeData({required String url}) async {
    final Response response = await dio.get(url);
    return EpisodeModel.fromJson(response.data);
  }
}
