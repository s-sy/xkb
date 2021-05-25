part of 'echarts_bloc.dart';

@freezed
abstract class EchartsEvent with _$EchartsEvent {
  const factory EchartsEvent.started() = _Started;
  const factory EchartsEvent.getPie() = _GetPie;
  const factory EchartsEvent.getDatePortion(int portion) = _GetDatePortion;
  const factory EchartsEvent.getDuration(
      int duration, int portion, String key) = _GetDuration;
  const factory EchartsEvent.changeDurtion(int i) = _ChangeDurtion;
  const factory EchartsEvent.changePortion(int i) = _ChangePortion;
  // changeDurtion
  // changePortion
  const factory EchartsEvent.getFastreport(
          int duration, int portion, String id, String key, int weekIndex) =
      _GetFastreport;
  const factory EchartsEvent.getHouseName() = _GetHouseName;
}
