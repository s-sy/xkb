part of 'mine_bloc.dart';

@freezed
abstract class MineState with _$MineState {
  const factory MineState({
    @required List<dynamic> processList,
    @required bool isAffId,
    @required String getErWeiCode,
    @required List<dynamic> shareCode,
    @required String submitInfo,
    @required Map<String, dynamic> testVersion,
    @required Option<Either<ValueFailure, Unit>> processFailureOrSuccessOption,
  }) = _MineState;

  factory MineState.initial() => MineState(
        processList: [],
        isAffId: true,
        processFailureOrSuccessOption: none(),
        getErWeiCode: "",
        shareCode: [],
        submitInfo: "",
        testVersion: {},
      );
}
