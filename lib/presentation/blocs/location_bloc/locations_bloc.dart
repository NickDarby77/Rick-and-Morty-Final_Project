import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_project/data/models/locations_model.dart';
import 'package:rick_and_morty_project/data/repositories/location_repository.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final LocationRepository repository;

  LocationsBloc({required this.repository}) : super(LocationsInitial()) {
    on<GetLocationsDataEvent>((event, emit) async {
      emit(LocationsLoading());

      try {
        final result = await repository.getLocationsData(
          name: event.name,
          type: event.type,
          dimension: event.dimension,
          page: event.page,
        );
        emit(
          LocationsSuccess(model: result),
        );
      } catch (e) {
        if (e is DioException) {
          emit(
            LocationsError(
              errorText: e.response?.data.toString() ?? '',
            ),
          );
        } else {
          emit(
            LocationsError(
              errorText: e.toString(),
            ),
          );
        }
      }
    });
  }
}
