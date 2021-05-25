part of 'buyinghouse_bloc.dart';

@freezed
abstract class BuyinghouseState with _$BuyinghouseState {
  const factory BuyinghouseState({
    int index,
    Map project,
    List salesman,
    Map salesmanItem,
    bool isGoodPhone,
    bool isRepeat,
  }) = _BuyinghouseState;
  factory BuyinghouseState.initial() => BuyinghouseState(
        index: 0,
        project: {},
        salesman: [],
        salesmanItem: {},
        isGoodPhone: false,
        isRepeat: false,
      );
}
