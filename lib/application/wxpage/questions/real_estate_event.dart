part of 'real_estate_bloc.dart';

@freezed
abstract class RealEstateEvent with _$RealEstateEvent {
  const factory RealEstateEvent.started(Map<String, dynamic> affData) =
      _Started;
  const factory RealEstateEvent.chagecurrent() = _Chagecurrent;
  const factory RealEstateEvent.releaseprealestate(String value) =
      _Releaseprealestate;
  const factory RealEstateEvent.commentrealestate(
      String value, Map<String, dynamic> maps) = _Commentrealestate;
}
