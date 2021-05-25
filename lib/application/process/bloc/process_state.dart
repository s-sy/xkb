part of 'process_bloc.dart';

@freezed
abstract class ProcessState with _$ProcessState {
  const factory ProcessState({
    @required List<dynamic> processList,
    @required Map<String, dynamic> dealWithProcess,
    @required List<dynamic> nextRemind,
    @required List<dynamic> handleByConsultant,
    @required List<dynamic> shareCode,
    @required Option<Either<ValueFailure, Unit>> processFailureOrSuccessOption,
  }) = _ProcessState;

  factory ProcessState.initial() => ProcessState(
        nextRemind: [],
        processList: [],
        dealWithProcess: {},
        handleByConsultant: [],
        shareCode: [],
        processFailureOrSuccessOption: none(),
      );
}
