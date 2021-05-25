part of 'choosetented_bloc.dart';

@freezed
abstract class ChoosetentedEvent with _$ChoosetentedEvent {
  const factory ChoosetentedEvent.started() = _Started;

  const factory ChoosetentedEvent.chahgeShowPlat(
      String type, Map<String, Object> value) = _ChahgeShowPlat;

  const factory ChoosetentedEvent.changhotcity(Map<String, Object> value) =
      _Changhotcity;
  const factory ChoosetentedEvent.resetSearch() = _ResetSearch;
}
