part of 'recommend_buy_house_bloc.dart';

@freezed
abstract class RecommendBuyHouseEvent with _$RecommendBuyHouseEvent {
  const factory RecommendBuyHouseEvent.started() = _Started;
  const factory RecommendBuyHouseEvent.checkphonebyborker(String phone) =
      _Checkphonebyborker;
  const factory RecommendBuyHouseEvent.sendworkflow(
      String name, String phone, String remark, String sex) = _Sendworkflow;
  const factory RecommendBuyHouseEvent.getProcessDefinition() =
      _GetProcessDefinition;
  const factory RecommendBuyHouseEvent.getTaills() = _GetTaills;
  const factory RecommendBuyHouseEvent.repeatTip() = _RepeatTip;
}
