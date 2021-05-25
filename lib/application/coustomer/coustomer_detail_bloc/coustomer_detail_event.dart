part of 'coustomer_detail_bloc.dart';

@freezed
abstract class CoustomerDetailEvent with _$CoustomerDetailEvent {
  const factory CoustomerDetailEvent.started() = _Started;
}