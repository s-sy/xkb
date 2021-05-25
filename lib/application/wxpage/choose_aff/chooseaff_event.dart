part of 'chooseaff_bloc.dart';

@freezed
abstract class ChooseaffEvent with _$ChooseaffEvent {
  const factory ChooseaffEvent.started(Map<String, dynamic> data) = _Started;
  const factory ChooseaffEvent.savetendent(Map<String, Object> data) =
      _Savetendent;
}
