part of 'recommend_buy_house_bloc.dart';

@freezed
abstract class RecommendBuyHouseState with _$RecommendBuyHouseState {
  const factory RecommendBuyHouseState({
    String brokerId,
    String enrecommendId,
    List salesman,
    Map salesmanItem,
    bool isGoodPhone,
    String repeatTip,
  }) = _RecommendBuyHouseState;
  factory RecommendBuyHouseState.initial() => RecommendBuyHouseState(
        brokerId: "",
        enrecommendId: "",
        salesman: [],
        salesmanItem: {},
        isGoodPhone: false,
        repeatTip: "",
      );
}
