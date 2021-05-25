part of 'dazzle_the_real_estate_bloc.dart';

@freezed
abstract class DazzleTheRealEstateEvent with _$DazzleTheRealEstateEvent {
  const factory DazzleTheRealEstateEvent.started(Map<String, dynamic> affData) =
      _Started;
  const factory DazzleTheRealEstateEvent.chagecurrent() = _Chagecurrent;
  const factory DazzleTheRealEstateEvent.releasedazzle(
      String description, List imgData) = _Releasedazzle;
  const factory DazzleTheRealEstateEvent.commentdazzle(
      String value, Map<String, dynamic> maps) = _Commentdazzle;
  const factory DazzleTheRealEstateEvent.qiNiuLoad(String imgPath) = _QiNiuLoad;
  const factory DazzleTheRealEstateEvent.removeImg(int index) = _RemoveImg;
}
