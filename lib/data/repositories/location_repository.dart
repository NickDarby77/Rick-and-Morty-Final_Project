import 'package:dio/dio.dart';
import 'package:rick_and_morty_project/data/models/locations_model.dart';

class LocationRepository {
  final Dio dio;

  LocationRepository({required this.dio});

  Future<LocationsModel> getLocationsData({
    String? name,
    String? type,
    String? dimension,
    String? page,
  }) async {
    final Response response = await dio.get(
      'https://rickandmortyapi.com/api/location',
      queryParameters: {
        "name": name,
        "type": type,
        "dimension": dimension,
        "page": page,
      },
    );
    return LocationsModel.fromJson(response.data);
  }
}
