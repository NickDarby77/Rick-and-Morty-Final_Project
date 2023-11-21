part of 'locations_bloc.dart';

@immutable
sealed class LocationsEvent {}

final class GetLocationsDataEvent extends LocationsEvent {
  final String? name;
  final String? type;
  final String? dimension;
  final String? page;

  GetLocationsDataEvent({
    this.name,
    this.type,
    this.dimension,
    this.page,
  });
}
