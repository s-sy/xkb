part of 'chooseaff_bloc.dart';

@freezed
abstract class ChooseaffState with _$ChooseaffState {
  const factory ChooseaffState({
    List affList,
  }) = _ChooseaffState;
  factory ChooseaffState.initial() => ChooseaffState(affList: [],);
}
